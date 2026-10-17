#!/usr/bin/env bash
# Installs the YouTube app for the current user.
set -euo pipefail
cd "$(dirname "$0")"

install -Dm755 youtube-app.sh "$HOME/.local/bin/youtube-app.sh"
install -Dm644 youtube-app.svg "$HOME/.local/share/icons/youtube-app.svg"
sed "s#^Exec=youtube-app.sh#Exec=$HOME/.local/bin/youtube-app.sh#; s#^Icon=youtube-app#Icon=$HOME/.local/share/icons/youtube-app.svg#" \
  youtube-app.desktop > "$HOME/.local/share/applications/youtube-app.desktop"
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo "Installed. Open YouTube from the app menu, then add the extensions listed in the README."
