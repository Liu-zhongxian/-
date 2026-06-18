param(
  [string]$SpaceId = "7644091204958866380",
  [string]$SpaceName = "AI Spark AI Wiki"
)

$ErrorActionPreference = "Stop"

function Invoke-LarkJson {
  param([string[]]$ArgsList)

  $larkCli = "C:\Users\Drunk\AppData\Local\nvm\v22.22.2\node_modules\@larksuite\cli\bin\lark-cli.exe"
  if (-not (Test-Path -LiteralPath $larkCli)) {
    $larkCli = (Get-Command "lark-cli.exe").Source
  }

  $psi = [System.Diagnostics.ProcessStartInfo]::new()
  $psi.FileName = $larkCli
  $psi.Arguments = ($ArgsList | ForEach-Object {
    if ($_ -match '^[A-Za-z0-9_+./:=|~-]+$') {
      $_
    } else {
      '"' + ($_ -replace '"', '\"') + '"'
    }
  }) -join " "
  $psi.RedirectStandardOutput = $true
  $psi.RedirectStandardError = $true
  $psi.UseShellExecute = $false
  $proc = [System.Diagnostics.Process]::Start($psi)
  $stdout = $proc.StandardOutput.ReadToEnd()
  $stderr = $proc.StandardError.ReadToEnd()
  $proc.WaitForExit()

  $text = ($stdout + "`n" + $stderr).Trim()
  if ($proc.ExitCode -ne 0) {
    throw $text
  }

  $start = $text.IndexOf("{")
  $end = $text.LastIndexOf("}")
  if ($start -lt 0 -or $end -lt $start) {
    throw "No JSON object found in lark-cli output: $text"
  }

  return $text.Substring($start, $end - $start + 1) | ConvertFrom-Json
}

function Convert-ToSafeName {
  param([string]$Name)

  $safe = $Name -replace '[<>:"/\\|?*]', '-'
  $safe = $safe -replace '\s+', ' '
  $safe = $safe.Trim().TrimEnd(".")
  if ([string]::IsNullOrWhiteSpace($safe)) {
    return "untitled"
  }
  return $safe
}

function Convert-LarkMarkdown {
  param(
    [string]$Markdown,
    [string]$Title
  )

  $content = $Markdown -replace '(?s)<title>.*?</title>\s*', ''
  $content = $content -replace '<callout emoji="([^"]*)">', '> [!NOTE] $1'
  $content = $content -replace '</callout>', ''
  $content = $content -replace '<grid>', ''
  $content = $content -replace '</grid>', ''
  $content = $content -replace '<column[^>]*>', ''
  $content = $content -replace '</column>', ''
  $content = $content.Trim()

  return "# $Title`r`n`r`n$content`r`n"
}

function Get-WikiNodes {
  param(
    [string]$SpaceId,
    [string]$ParentNodeToken = ""
  )

  $argsList = @("wiki", "+node-list", "--as", "bot", "--space-id", $SpaceId, "--json", "--page-all")
  if ($ParentNodeToken) {
    $argsList += @("--parent-node-token", $ParentNodeToken)
  }
  $result = Invoke-LarkJson $argsList
  return @($result.data.nodes)
}

function Sync-Node {
  param(
    [object]$Node,
    [string]$ParentPath
  )

  $safeTitle = Convert-ToSafeName $Node.title
  $nodePath = Join-Path $ParentPath $safeTitle

  if ($Node.obj_type -eq "docx") {
    $doc = Invoke-LarkJson @(
      "docs", "+fetch",
      "--api-version", "v2",
      "--doc", $Node.obj_token,
      "--doc-format", "markdown",
      "--detail", "simple",
      "--as", "bot",
      "--json"
    )

    $raw = [string]$doc.data.document.content
    $normalized = Convert-LarkMarkdown -Markdown $raw -Title $Node.title

    $targetFile = "$nodePath.md"
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $targetFile) | Out-Null
    $targetDir = (Resolve-Path (Split-Path -Parent $targetFile)).Path
    $targetFullPath = Join-Path $targetDir (Split-Path -Leaf $targetFile)
    [System.IO.File]::WriteAllText($targetFullPath, $normalized, [System.Text.UTF8Encoding]::new($false))

    $rawDir = Join-Path ".feishu-cache\raw" $SpaceId
    New-Item -ItemType Directory -Force -Path $rawDir | Out-Null
    [System.IO.File]::WriteAllText((Join-Path $rawDir "$($Node.node_token).lark.md"), $raw, [System.Text.UTF8Encoding]::new($false))
  }

  $metaDir = Join-Path ".feishu-cache\meta" $SpaceId
  New-Item -ItemType Directory -Force -Path $metaDir | Out-Null
  $meta = [ordered]@{
    space_id = $Node.space_id
    node_token = $Node.node_token
    obj_token = $Node.obj_token
    obj_type = $Node.obj_type
    title = $Node.title
    parent_node_token = $Node.parent_node_token
    has_child = $Node.has_child
    path = if ($Node.obj_type -eq "docx") { "$nodePath.md" } else { $nodePath }
    synced_at = (Get-Date).ToString("o")
  }
  $metaJson = $meta | ConvertTo-Json -Depth 5
  [System.IO.File]::WriteAllText((Join-Path $metaDir "$($Node.node_token).json"), $metaJson, [System.Text.UTF8Encoding]::new($false))

  if ($Node.has_child) {
    $children = Get-WikiNodes -SpaceId $SpaceId -ParentNodeToken $Node.node_token
    foreach ($child in $children) {
      Sync-Node -Node $child -ParentPath $nodePath
    }
  }
}

$root = Join-Path "docs" (Convert-ToSafeName $SpaceName)
New-Item -ItemType Directory -Force -Path $root | Out-Null

$nodes = Get-WikiNodes -SpaceId $SpaceId
foreach ($node in $nodes) {
  Sync-Node -Node $node -ParentPath $root
}

Write-Output "Synced $($nodes.Count) root node(s) from $SpaceName."
