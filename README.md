# dotfiles

Personal configuration files for various tools.

## Contents

| Config | Source | Target |
|--------|--------|--------|
| Git | `.gitconfig` | `~/.gitconfig` (always copied) |
| mpv | `mpv/mpv.conf` | `~/.config/mpv/mpv.conf` (if directory exists) |
| RIME (fcitx5) | `RIME/*.yaml` | `~/.local/share/fcitx5/rime/` (if directory exists) |

## Installation

```bash
./install.sh
```

The script checks for the existence of target directories before copying:

- `.gitconfig` is always copied
- mpv config is copied only if `~/.config/mpv/` exists
- RIME configs are copied only if `~/.local/share/fcitx5/rime/` exists
