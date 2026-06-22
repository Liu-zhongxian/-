param(
  [string]$SpaceId = "7644091204958866380",
  [string]$SpaceName = "AI Spark AI Wiki",
  [string]$RootReadmeTitle = "",
  [switch]$DryRun,
  [int]$MaxDocuments = 0
)

$ErrorActionPreference = "Stop"

function Get-RepoRoot {
  $root = git rev-parse --show-toplevel
  if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($root)) {
    throw "This script must be run inside a Git repository."
  }
  return $root.Trim()
}

function Get-LarkCli {
  $knownPath = "C:\Users\Drunk\AppData\Local\nvm\v22.22.2\node_modules\@larksuite\cli\bin\lark-cli.exe"
  if (Test-Path -LiteralPath $knownPath) {
    return $knownPath
  }

  $cmd = Get-Command "lark-cli.exe" -ErrorAction SilentlyContinue
  if ($cmd) {
    return $cmd.Source
  }

  $cmd = Get-Command "lark-cli" -ErrorAction SilentlyContinue
  if ($cmd) {
    return $cmd.Source
  }

  throw "lark-cli was not found. Install/configure larksuite/cli before running this script."
}

function Convert-ToProcessArgument {
  param([string]$Argument)

  if ($null -eq $Argument) {
    return '""'
  }

  if ($Argument -notmatch '[\s"]') {
    return $Argument
  }

  $escaped = $Argument -replace '(\\*)"', '$1$1\"'
  $escaped = $escaped -replace '(\\+)$', '$1$1'
  return '"' + $escaped + '"'
}

function Invoke-LarkJson {
  param([string[]]$ArgsList)

  $larkCli = Get-LarkCli
  $psi = [System.Diagnostics.ProcessStartInfo]::new()
  $psi.FileName = $larkCli
  $psi.Arguments = ($ArgsList | ForEach-Object { Convert-ToProcessArgument $_ }) -join " "
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

  $safe = $Name -replace '[<>:"/\\|?*]', '_'
  $safe = $safe -replace '\s+', ' '
  $safe = $safe.Trim().TrimEnd(".")
  if ([string]::IsNullOrWhiteSpace($safe)) {
    return "untitled"
  }
  return $safe
}

function Convert-ToBlockquote {
  param(
    [string]$Body,
    [string]$Emoji
  )

  $bodyText = $Body.Trim()
  if ([string]::IsNullOrWhiteSpace($bodyText)) {
    return ""
  }

  $lines = $bodyText -split "\r?\n"
  $result = New-Object System.Collections.Generic.List[string]
  $firstContentLine = $true

  foreach ($line in $lines) {
    $trimmed = $line.TrimEnd()
    if ([string]::IsNullOrWhiteSpace($trimmed)) {
      $result.Add(">")
      continue
    }

    if ($firstContentLine -and -not [string]::IsNullOrWhiteSpace($Emoji)) {
      $result.Add("> $Emoji $trimmed")
      $firstContentLine = $false
    } else {
      $result.Add("> $trimmed")
      $firstContentLine = $false
    }
  }

  return ($result -join "`r`n")
}

function Get-RelativeMarkdownPath {
  param(
    [string]$FromFile,
    [string]$ToFile
  )

  $fromFullPath = [System.IO.Path]::GetFullPath($FromFile)
  $fromDir = Split-Path -Parent $fromFullPath
  $toPath = Resolve-Path -LiteralPath $ToFile
  $fromUri = [System.Uri]::new(($fromDir.TrimEnd('\') + '\'))
  $toUri = [System.Uri]::new($toPath.Path)
  return [System.Uri]::UnescapeDataString($fromUri.MakeRelativeUri($toUri).ToString())
}

function Get-RelativePathFromCurrentDirectory {
  param([string]$Path)

  $basePath = [System.IO.Path]::GetFullPath((Get-Location).Path + [System.IO.Path]::DirectorySeparatorChar)
  $targetPath = [System.IO.Path]::GetFullPath($Path)
  $baseUri = [System.Uri]::new($basePath)
  $targetUri = [System.Uri]::new($targetPath)
  return [System.Uri]::UnescapeDataString($baseUri.MakeRelativeUri($targetUri).ToString()).Replace('/', '\')
}

function Get-FallbackAssetPath {
  param([string]$Token)

  $fallbacks = @{
    "Okq2biTVmoymlPx54jrccdkfnVg" = "assets\file-20260605133042988.png"
    "GhXcbsn6Coyc22x6Lu5c2OZtnrb" = "assets\file-20260605133042988.png"
  }

  if ($fallbacks.ContainsKey($Token)) {
    return $fallbacks[$Token]
  }

  return $null
}

function Save-FallbackAsset {
  param(
    [string]$Token,
    [string]$AssetDir,
    [string]$MarkdownFile
  )

  $fallbackPath = Get-FallbackAssetPath -Token $Token
  if ([string]::IsNullOrWhiteSpace($fallbackPath)) {
    return $null
  }

  $sourcePath = Join-Path (Get-RepoRoot) $fallbackPath
  if (-not (Test-Path -LiteralPath $sourcePath)) {
    return $null
  }

  New-Item -ItemType Directory -Force -Path $AssetDir | Out-Null
  $targetPath = Join-Path $AssetDir (Split-Path -Leaf $sourcePath)
  Copy-Item -LiteralPath $sourcePath -Destination $targetPath -Force
  return Get-RelativeMarkdownPath -FromFile $MarkdownFile -ToFile $targetPath
}

function Save-FeishuAsset {
  param(
    [string]$Token,
    [string]$AssetDir,
    [string]$MarkdownFile
  )

  if ([string]::IsNullOrWhiteSpace($Token)) {
    return $null
  }

  New-Item -ItemType Directory -Force -Path $AssetDir | Out-Null

  $existing = @(Get-ChildItem -LiteralPath $AssetDir -File -Filter "$Token.*" -ErrorAction SilentlyContinue)
  if ($existing.Count -eq 0) {
    if (-not $script:MediaDownloadAvailable) {
      return Save-FallbackAsset -Token $Token -AssetDir $AssetDir -MarkdownFile $MarkdownFile
    }

    $outputBase = Get-RelativePathFromCurrentDirectory -Path (Join-Path $AssetDir $Token)
    try {
      Invoke-LarkJson @(
        "docs", "+media-download",
        "--as", "bot",
        "--token", $Token,
        "--output", $outputBase,
        "--overwrite",
        "--json"
      ) | Out-Null
    } catch {
      $message = $_.Exception.Message
      if ($message -match "99991672|docs:document\.media:download") {
        $script:MediaDownloadAvailable = $false
        if (-not $script:MediaDownloadWarningShown) {
          Write-Warning "Media download permission is missing. Enable docs:document.media:download for the bot to localize all Feishu images."
          $script:MediaDownloadWarningShown = $true
        }
      }

      $fallback = Save-FallbackAsset -Token $Token -AssetDir $AssetDir -MarkdownFile $MarkdownFile
      if ($fallback) {
        Write-Warning "Media token $Token could not be downloaded; used local fallback asset."
        return $fallback
      }

      if (-not $script:MediaDownloadAvailable) {
        return $null
      }
      throw
    }
    $existing = @(Get-ChildItem -LiteralPath $AssetDir -File -Filter "$Token.*" -ErrorAction SilentlyContinue)
  }

  if ($existing.Count -eq 0) {
    Write-Warning "Downloaded media token $Token, but no output file was found."
    return $null
  }

  return Get-RelativeMarkdownPath -FromFile $MarkdownFile -ToFile $existing[0].FullName
}

function Convert-LarkMarkdown {
  param(
    [string]$Markdown,
    [string]$Title,
    [string]$TargetFile
  )

  $content = $Markdown -replace '(?s)<title>.*?</title>\s*', ''
  $content = $content -replace '<grid>', ''
  $content = $content -replace '</grid>', ''
  $content = $content -replace '<column[^>]*>', ''
  $content = $content -replace '</column>', ''

  $calloutPattern = '(?s)<callout emoji="([^"]*)">\s*(.*?)\s*</callout>'
  $content = [System.Text.RegularExpressions.Regex]::Replace(
    $content,
    $calloutPattern,
    [System.Text.RegularExpressions.MatchEvaluator]{
      param($match)
      Convert-ToBlockquote -Emoji $match.Groups[1].Value -Body $match.Groups[2].Value
    }
  )

  $assetDir = Join-Path (Split-Path -Parent $TargetFile) "assets"
  $imagePattern = '!\[([^\]]*)\]\(https://feishu\.cn/file/([A-Za-z0-9]+)\)'
  $content = [System.Text.RegularExpressions.Regex]::Replace(
    $content,
    $imagePattern,
    [System.Text.RegularExpressions.MatchEvaluator]{
      param($match)
      $alt = $match.Groups[1].Value
      $token = $match.Groups[2].Value
      try {
        $relativePath = Save-FeishuAsset -Token $token -AssetDir $assetDir -MarkdownFile $TargetFile
        if ($relativePath) {
          return "![$alt]($relativePath)"
        }
      } catch {
        Write-Warning "Failed to download media token $token`: $($_.Exception.Message)"
      }
      return $match.Value
    }
  )

  $content = $content.Trim()
  do {
    $previousContent = $content
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, "^\s*#\s+.*?[ \t]*(\r?\n|$)", "", 1).Trim()
  } while ($content -ne $previousContent)
  if ([string]::IsNullOrWhiteSpace($content)) {
    return "# $Title`r`n"
  }
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
    [string]$ParentPath,
    [System.Collections.Generic.List[object]]$Manifest
  )

  if ($script:SyncedDocuments -ge $MaxDocuments -and $MaxDocuments -gt 0) {
    return
  }

  $safeTitle = Convert-ToSafeName $Node.title
  $nodePath = Join-Path $ParentPath $safeTitle

  if ($Node.obj_type -eq "docx") {
    $targetFile = "$nodePath.md"
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $targetFile) | Out-Null

    Write-Output "Fetching: $($Node.title)"
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
    $normalized = Convert-LarkMarkdown -Markdown $raw -Title $Node.title -TargetFile $targetFile
    [System.IO.File]::WriteAllText($targetFile, $normalized, [System.Text.UTF8Encoding]::new($false))
    $script:SyncedDocuments++

    $Manifest.Add([ordered]@{
      space_id = $Node.space_id
      node_token = $Node.node_token
      obj_token = $Node.obj_token
      obj_type = $Node.obj_type
      title = $Node.title
      parent_node_token = $Node.parent_node_token
      has_child = $Node.has_child
      path = $targetFile
      revision_id = $doc.data.document.revision_id
      synced_at = (Get-Date).ToString("o")
    })
  }

  if ($Node.has_child) {
    $children = Get-WikiNodes -SpaceId $SpaceId -ParentNodeToken $Node.node_token
    foreach ($child in $children) {
      Sync-Node -Node $child -ParentPath $nodePath -Manifest $Manifest
    }
  }
}

function Publish-Staging {
  param(
    [string]$RepoRoot,
    [string]$StagingRoot,
    [object[]]$RootNodes
  )

  $managedNames = New-Object System.Collections.Generic.HashSet[string]
  $managedNames.Add("README.md") | Out-Null
  $managedNames.Add("assets") | Out-Null
  foreach ($node in $RootNodes) {
    $safeTitle = Convert-ToSafeName $node.title
    $managedNames.Add($safeTitle) | Out-Null
    $managedNames.Add("$safeTitle.md") | Out-Null
  }

  foreach ($name in $managedNames) {
    $target = Join-Path $RepoRoot $name
    if (Test-Path -LiteralPath $target) {
      Remove-Item -LiteralPath $target -Recurse -Force
    }
  }

  Get-ChildItem -LiteralPath $StagingRoot -Force | ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination (Join-Path $RepoRoot $_.Name) -Recurse -Force
  }
}

$repoRoot = Get-RepoRoot
Set-Location $repoRoot

$cacheRoot = Join-Path $repoRoot ".feishu-cache"
$stagingRoot = Join-Path $cacheRoot ("staging-" + (Get-Date -Format "yyyyMMdd-HHmmss"))
New-Item -ItemType Directory -Force -Path $stagingRoot | Out-Null

$script:SyncedDocuments = 0
$script:MediaDownloadAvailable = $true
$script:MediaDownloadWarningShown = $false
$manifest = New-Object System.Collections.Generic.List[object]

Write-Output "Listing root nodes from $SpaceName ($SpaceId)..."
$rootNodes = Get-WikiNodes -SpaceId $SpaceId

foreach ($node in $rootNodes) {
  Sync-Node -Node $node -ParentPath $stagingRoot -Manifest $manifest
}

if ([string]::IsNullOrWhiteSpace($RootReadmeTitle) -and $rootNodes.Count -gt 0) {
  $RootReadmeTitle = $rootNodes[0].title
}

$rootReadme = Join-Path $stagingRoot "$((Convert-ToSafeName $RootReadmeTitle)).md"
if (Test-Path -LiteralPath $rootReadme) {
  Copy-Item -LiteralPath $rootReadme -Destination (Join-Path $stagingRoot "README.md") -Force
}

$manifestPath = Join-Path $cacheRoot "manifest.json"
New-Item -ItemType Directory -Force -Path $cacheRoot | Out-Null
$manifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

if ($DryRun) {
  Write-Output "Dry run complete. Staging output: $stagingRoot"
} else {
  Publish-Staging -RepoRoot $repoRoot -StagingRoot $stagingRoot -RootNodes $rootNodes
  Write-Output "Published staged wiki content to repository root."
}

Write-Output "Synced $script:SyncedDocuments document(s) from $SpaceName."



