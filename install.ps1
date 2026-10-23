# Windows port of install.sh: sets up the YouTube app launcher and Desktop/Start Menu
# shortcuts, instead of a .desktop entry (there's no Linux app-menu database to update).
$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$launcher = Join-Path $repoRoot "youtube-app.ps1"
$icon = Join-Path $repoRoot "youtube-app.ico"

$ws = New-Object -ComObject WScript.Shell

function New-AppShortcut($path) {
  $s = $ws.CreateShortcut($path)
  $s.TargetPath = "powershell.exe"
  $s.Arguments = "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$launcher`""
  $s.WorkingDirectory = $repoRoot
  $s.IconLocation = $icon
  $s.Description = "YouTube as its own app, with Discord RPC via PreMiD"
  $s.Save()
}

New-AppShortcut (Join-Path ([Environment]::GetFolderPath("Desktop")) "YouTube.lnk")
New-AppShortcut (Join-Path (Join-Path ([Environment]::GetFolderPath("StartMenu")) "Programs") "YouTube.lnk")

Write-Host "Installed. Open YouTube from the Desktop or Start Menu, then add the extensions listed in the README from the Chrome Web Store inside the app window."
