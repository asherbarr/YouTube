# YouTube

YouTube as its own desktop app on Linux, with Discord RPC (Rich Presence).

It's a lightweight launcher: YouTube runs in Chromium's app mode, in its own window and with its own
profile, so it shows up as a separate app with its own icon, sign-in and extensions, apart from your browser.

## What makes it special

- **Discord RPC** through [PreMiD](https://chromewebstore.google.com/detail/agjnjboanicjcpenljmaaigopkgdnihi): Discord shows the video you're watching.
- **No Shorts**, with [Remove YouTube Shorts](https://chromewebstore.google.com/detail/mgngbgbhliflggkamjnpdmegbkidiapm).
- **Dislikes are back**, with [Return YouTube Dislike](https://chromewebstore.google.com/detail/gebbhagfogifgggkldgodflihgfeippi).
- No Electron and nothing bundled: it uses the Chromium already on your system.

## Requirements

- Linux
- Chromium (`chromium-browser`, e.g. `sudo dnf install chromium` on Fedora)

## Install

```bash
./install.sh
```

Then open **YouTube** from the app menu and add the three extensions above from the Chrome Web Store
inside the app window. They stay in the app's own profile (`~/.local/share/youtube-app-profile`).

## Windows

Uses an installed Chromium-based browser (Chrome if present, otherwise Edge, which ships with
Windows) in the same `--app` mode instead of `chromium-browser`, with its own profile under
`%LOCALAPPDATA%\youtube-app-profile`.

```powershell
.\install.ps1
```

Creates Desktop and Start Menu shortcuts. Open **YouTube** from either, then add the three
extensions above from the Chrome Web Store inside the app window.
