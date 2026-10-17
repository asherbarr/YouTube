#!/usr/bin/env bash
exec chromium-browser \
  --app="https://www.youtube.com" \
  --user-data-dir="$HOME/.local/share/youtube-app-profile" \
  --class=YouTubeApp \
  --name=YouTubeApp \
  "$@"
