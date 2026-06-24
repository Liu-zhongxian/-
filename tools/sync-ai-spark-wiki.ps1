param(
  [string]$SpaceId = "7644091204958866380",
  [string]$SpaceName = "",
  [string]$WikiBaseUrl = "https://lcnniolukk80.feishu.cn/wiki",
  [string]$RootReadmeTitle = "",
  [switch]$DryRun,
  [int]$MaxDocuments = 0
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($SpaceName)) {
  $SpaceName = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("QUkgU3Bhcmsg55+l6K+G5bqT"))
}

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
  $arguments = ($ArgsList | ForEach-Object { Convert-ToProcessArgument $_ }) -join " "
  $maxAttempts = 5

  for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
    $psi = [System.Diagnostics.ProcessStartInfo]::new()
    $psi.FileName = $larkCli
    $psi.Arguments = $arguments
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.UseShellExecute = $false

    $proc = [System.Diagnostics.Process]::Start($psi)
    $stdout = $proc.StandardOutput.ReadToEnd()
    $stderr = $proc.StandardError.ReadToEnd()
    $proc.WaitForExit()

    $text = ($stdout + "`n" + $stderr).Trim()
    if ($proc.ExitCode -eq 0) {
      break
    }

    $isRateLimited = $text -match 'HTTP 429|rate.?limit|too many requests'
    if (-not $isRateLimited -or $attempt -eq $maxAttempts) {
      throw $text
    }

    $delaySeconds = [Math]::Min(60, 5 * [Math]::Pow(2, $attempt - 1))
    Write-Warning "lark-cli rate limited, retrying in $delaySeconds seconds (attempt $attempt/$maxAttempts)."
    Start-Sleep -Seconds $delaySeconds
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
  $toPath = [System.IO.Path]::GetFullPath($ToFile)
  $fromUri = [System.Uri]::new(($fromDir.TrimEnd('\') + '\'))
  $toUri = [System.Uri]::new($toPath)
  return [System.Uri]::UnescapeDataString($fromUri.MakeRelativeUri($toUri).ToString())
}

function Convert-ToMarkdownLinkPath {
  param([string]$Path)

  return $Path.Replace(" ", "%20")
}

function Convert-FeishuWikiLinks {
  param(
    [string]$Content,
    [string]$TargetFile
  )

  if ([string]::IsNullOrWhiteSpace($Content) -or $script:NodePathByToken.Count -eq 0) {
    return $Content
  }

  $wikiBase = [System.Text.RegularExpressions.Regex]::Escape($WikiBaseUrl.TrimEnd('/'))
  $wikiLinkPattern = "$wikiBase/([A-Za-z0-9]+)(\?[^)\s>]*)?"

  return [System.Text.RegularExpressions.Regex]::Replace(
    $Content,
    $wikiLinkPattern,
    [System.Text.RegularExpressions.MatchEvaluator]{
      param($match)
      $token = $match.Groups[1].Value
      if (-not $script:NodePathByToken.ContainsKey($token)) {
        return $match.Value
      }

      $relativePath = Get-RelativeMarkdownPath -FromFile $TargetFile -ToFile $script:NodePathByToken[$token]
      return Convert-ToMarkdownLinkPath -Path $relativePath
    }
  )
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
    $outputBase = Get-RelativePathFromCurrentDirectory -Path (Join-Path $AssetDir $Token)
    $downloadError = $null
    try {
      if ($script:MediaDownloadAvailable) {
        Invoke-LarkJson @(
          "docs", "+media-download",
          "--as", "bot",
          "--token", $Token,
          "--output", $outputBase,
          "--overwrite",
          "--json"
        ) | Out-Null
      } else {
        throw "media-download is disabled after a previous permission error"
      }
    } catch {
      $downloadError = $_.Exception.Message
      if ($downloadError -match "99991672|docs:document\.media:download") {
        $script:MediaDownloadAvailable = $false
        if (-not $script:MediaDownloadWarningShown) {
          Write-Warning "Media download permission is missing. Enable docs:document.media:download for the bot to localize all Feishu images."
          $script:MediaDownloadWarningShown = $true
        }
      }

      try {
        Invoke-LarkJson @(
          "docs", "+media-preview",
          "--as", "bot",
          "--token", $Token,
          "--output", $outputBase,
          "--overwrite",
          "--json"
        ) | Out-Null
        Write-Warning "Media token $Token used media-preview fallback after media-download failed."
      } catch {
        $previewError = $_.Exception.Message
        $fallback = Save-FallbackAsset -Token $Token -AssetDir $AssetDir -MarkdownFile $MarkdownFile
        if ($fallback) {
          Write-Warning "Media token $Token could not be downloaded or previewed; used local fallback asset."
          return $fallback
        }

        throw "Failed to save media token $Token. media-download error: $downloadError media-preview error: $previewError"
      }
    }
    $existing = @(Get-ChildItem -LiteralPath $AssetDir -File -Filter "$Token.*" -ErrorAction SilentlyContinue)
  }

  if ($existing.Count -eq 0) {
    Write-Warning "Downloaded media token $Token, but no output file was found."
    return $null
  }

  return Get-RelativeMarkdownPath -FromFile $MarkdownFile -ToFile $existing[0].FullName
}

function Get-ImageExtensionFromFile {
  param(
    [string]$Path,
    [string]$ContentType
  )

  $type = ([string]$ContentType).ToLowerInvariant()
  if ($type -match 'image/jpeg|image/jpg') { return '.jpg' }
  if ($type -match 'image/png') { return '.png' }
  if ($type -match 'image/gif') { return '.gif' }
  if ($type -match 'image/webp') { return '.webp' }

  if (Test-Path -LiteralPath $Path) {
    $bytes = [System.IO.File]::ReadAllBytes($Path)
    if ($bytes.Length -ge 4 -and $bytes[0] -eq 0xFF -and $bytes[1] -eq 0xD8) { return '.jpg' }
    if ($bytes.Length -ge 8 -and $bytes[0] -eq 0x89 -and $bytes[1] -eq 0x50 -and $bytes[2] -eq 0x4E -and $bytes[3] -eq 0x47) { return '.png' }
    if ($bytes.Length -ge 6 -and [System.Text.Encoding]::ASCII.GetString($bytes, 0, 3) -eq 'GIF') { return '.gif' }
    if ($bytes.Length -ge 12 -and [System.Text.Encoding]::ASCII.GetString($bytes, 0, 4) -eq 'RIFF' -and [System.Text.Encoding]::ASCII.GetString($bytes, 8, 4) -eq 'WEBP') { return '.webp' }
  }

  return '.bin'
}

function Save-RemoteImageAsset {
  param(
    [string]$Url,
    [string]$AssetDir,
    [string]$MarkdownFile,
    [int]$Index
  )

  if ([string]::IsNullOrWhiteSpace($Url)) {
    return $null
  }

  New-Item -ItemType Directory -Force -Path $AssetDir | Out-Null

  $baseName = 'image-{0:D3}' -f $Index
  $existing = @(Get-ChildItem -LiteralPath $AssetDir -File -Filter "$baseName.*" -ErrorAction SilentlyContinue)
  if ($existing.Count -eq 0) {
    $tempPath = Join-Path $AssetDir "$baseName.download"
    try {
      $response = Invoke-WebRequest -Uri $Url -OutFile $tempPath -UseBasicParsing
      $contentType = $null
      if ($response.Headers -and $response.Headers['Content-Type']) {
        $contentType = [string]$response.Headers['Content-Type']
      }
      $extension = Get-ImageExtensionFromFile -Path $tempPath -ContentType $contentType
      $targetPath = Join-Path $AssetDir "$baseName$extension"
      Move-Item -LiteralPath $tempPath -Destination $targetPath -Force
    } catch {
      if (Test-Path -LiteralPath $tempPath) {
        Remove-Item -LiteralPath $tempPath -Force
      }
      throw
    }
    $existing = @(Get-ChildItem -LiteralPath $AssetDir -File -Filter "$baseName.*" -ErrorAction SilentlyContinue)
  }

  if ($existing.Count -eq 0) {
    return $null
  }

  return Get-RelativeMarkdownPath -FromFile $MarkdownFile -ToFile $existing[0].FullName
}
function Convert-LarkMarkdown {
  param(
    [string]$Markdown,
    [string]$Title,
    [string]$TargetFile,
    [string]$NodeToken,
    [string]$ArchiveDate
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

  $remoteImageIndex = 0
  $remoteImagePattern = '!\[([^\]]*)\]\((https://[^)\s]*drive[^)\s]*\.feishu\.cn/space/api/box/stream/download/authcode/[^)\s]+)\)'
  $content = [System.Text.RegularExpressions.Regex]::Replace(
    $content,
    $remoteImagePattern,
    [System.Text.RegularExpressions.MatchEvaluator]{
      param($match)
      $alt = $match.Groups[1].Value
      $url = $match.Groups[2].Value
      $remoteImageIndex++
      try {
        $relativePath = Save-RemoteImageAsset -Url $url -AssetDir $assetDir -MarkdownFile $TargetFile -Index $remoteImageIndex
        if ($relativePath) {
          return "![$alt]($relativePath)"
        }
      } catch {
        Write-Warning "Failed to download remote image $url`: $($_.Exception.Message)"
      }
      return $match.Value
    }
  )

  $content = Convert-FeishuWikiLinks -Content $content -TargetFile $TargetFile
  $content = $content.Trim()
  do {
    $previousContent = $content
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, "^\s*#\s+.*?[ \t]*(\r?\n|$)", "", 1).Trim()
  } while ($content -ne $previousContent)

  $escapedTitle = [System.Text.RegularExpressions.Regex]::Escape($Title.Trim())
  if (-not [string]::IsNullOrWhiteSpace($escapedTitle)) {
    $duplicateTitlePattern = '(?m)^\s*#\s+' + $escapedTitle + '\s*$(\r?\n)?'
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $duplicateTitlePattern, "").Trim()
  }
  $footer = ""
  if (-not [string]::IsNullOrWhiteSpace($NodeToken)) {
    $sourceUrl = "$($WikiBaseUrl.TrimEnd('/'))/$NodeToken"
    $sourcePrefix = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("5p2l5rqQ77ya6aOe5LmmIMK3IA=="))
    $originalPrefix = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("IO+9nCDljp/mlofvvIjmnIDmlrDniYjvvInvvJo8"))
    $archivePrefix = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("PiDvvZwg5b2S5qGj77ya"))
    $footer = "`r`n`r`n---`r`n`r`n> $sourcePrefix$SpaceName$originalPrefix$sourceUrl$archivePrefix$ArchiveDate"
  }
  if ([string]::IsNullOrWhiteSpace($content)) {
    return "# $Title$footer`r`n"
  }
  return "# $Title`r`n`r`n$content$footer`r`n"
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
function Register-WikiNodePaths {
  param(
    [object[]]$Nodes,
    [string]$ParentPath
  )

  foreach ($node in $Nodes) {
    $safeTitle = Convert-ToSafeName $node.title
    $nodePath = Join-Path $ParentPath $safeTitle

    if ($node.obj_type -eq "docx") {
      $targetFile = "$nodePath.md"
      $script:NodePathByToken[$node.node_token] = $targetFile
      $script:NodePathByToken[$node.obj_token] = $targetFile
    }

    if ($node.has_child) {
      $children = Get-WikiNodes -SpaceId $SpaceId -ParentNodeToken $node.node_token
      $script:ChildrenByNodeToken[$node.node_token] = @($children)
      Register-WikiNodePaths -Nodes $children -ParentPath $nodePath
    }
  }
}

function Get-IndexedChildNodes {
  param([object]$Node)

  if ($script:ChildrenByNodeToken.ContainsKey($Node.node_token)) {
    return @($script:ChildrenByNodeToken[$Node.node_token])
  }

  return Get-WikiNodes -SpaceId $SpaceId -ParentNodeToken $Node.node_token
}

function Get-WikiNodeDetails {
  param([object]$Node)

  $nodeUrl = "$($WikiBaseUrl.TrimEnd('/'))/$($Node.node_token)"
  $lastError = $null

  for ($attempt = 1; $attempt -le 3; $attempt++) {
    try {
      $result = Invoke-LarkJson @(
        "wiki", "+node-get",
        "--node-token", $nodeUrl,
        "--space-id", $SpaceId,
        "--as", "bot",
        "--json"
      )
      return $result.data
    } catch {
      $lastError = $_.Exception.Message
      if ($attempt -lt 3) {
        Write-Warning "Retrying wiki node details for $($Node.node_token) after attempt $attempt failed."
        Start-Sleep -Seconds (2 * $attempt)
      }
    }
  }

  throw "Failed to read wiki node details for $($Node.node_token) after 3 attempts: $lastError"
}

function Get-ArchiveDate {
  param([object]$NodeDetails)

  if ($NodeDetails.updated_at) {
    try {
      return ([System.DateTimeOffset]::Parse([string]$NodeDetails.updated_at)).ToLocalTime().ToString("yyyy-MM-dd")
    } catch {}
  }

  if ($NodeDetails.obj_edit_time) {
    try {
      $seconds = [int64]$NodeDetails.obj_edit_time
      return [System.DateTimeOffset]::FromUnixTimeSeconds($seconds).ToLocalTime().ToString("yyyy-MM-dd")
    } catch {}
  }

  return (Get-Date).ToString("yyyy-MM-dd")
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

    $nodeDetails = Get-WikiNodeDetails -Node $Node
    $archiveDate = Get-ArchiveDate -NodeDetails $nodeDetails
    $raw = [string]$doc.data.document.content
    $normalized = Convert-LarkMarkdown -Markdown $raw -Title $Node.title -TargetFile $targetFile -NodeToken $Node.node_token -ArchiveDate $archiveDate
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
      obj_edit_time = $nodeDetails.obj_edit_time
      updated_at = $nodeDetails.updated_at
      archive_date = $archiveDate
      synced_at = (Get-Date).ToString("o")
    })
  }

  if ($Node.has_child) {
    $children = Get-IndexedChildNodes -Node $Node
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
$script:NodePathByToken = [System.Collections.Generic.Dictionary[string,string]]::new()
$script:ChildrenByNodeToken = [System.Collections.Generic.Dictionary[string,object[]]]::new()
$manifest = New-Object System.Collections.Generic.List[object]

Write-Output "Listing root nodes from $SpaceName ($SpaceId)..."
$rootNodes = Get-WikiNodes -SpaceId $SpaceId
Write-Output "Indexing wiki node paths for relative links..."
Register-WikiNodePaths -Nodes $rootNodes -ParentPath $stagingRoot

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









