# Windows port of youtube-app.sh.
# Linux version shells out to `chromium-browser --app=...`; Windows has no chromium-browser
# on PATH by convention, so this finds an installed Chromium-based browser (prefers Chrome,
# falls back to Edge, which ships with every Windows install) and launches it the same way.
$ErrorActionPreference = "Stop"

$candidates = @(
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
)
$browser = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $browser) {
  Write-Error "No Chromium-based browser (Chrome or Edge) found."
  exit 1
}

$profileDir = Join-Path $env:LOCALAPPDATA "youtube-app-profile"

& $browser `
  "--app=https://www.youtube.com" `
  "--user-data-dir=$profileDir" `
  "--class=YouTubeApp"
