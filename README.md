# configs

Personal configuration files for various tools.

## Contents

| Config | Source | Target |
|--------|--------|--------|
| Git config | `git/config` | `~/.config/git/config` (always copied) |
| Git ignore | `git/ignore` | `~/.config/git/ignore` (if directory exists) |
| mpv | `mpv/mpv.conf` | `~/.config/mpv/mpv.conf` (if directory exists) |
| RIME (fcitx5) | `RIME/*.yaml` | `~/.local/share/fcitx5/rime/` (if directory exists) |
| WPS Office (fcitx5) | `wps_office/wps_im.sh` | `/bin/wps` (modifies in-place, requires `wps-office-cn` from AUR + fcitx5) |

## Installation

```bash
./install.sh
```

The script checks for the existence of target directories before copying:

- `git/config` is always copied to `~/.config/git/config`
- `git/ignore` is copied to `~/.config/git/ignore` only if `~/.config/git/` exists
- mpv config is copied only if `~/.config/mpv/` exists
- RIME configs are copied only if `~/.local/share/fcitx5/rime/` exists

### WPS Office Input Method (fcitx5)

The `wps_office/wps_im.sh` script patches `/bin/wps` (the WPS Office launcher script from `wps-office-cn` AUR package) to inject fcitx5 input method environment variables:

```bash
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

**Prerequisites:**
- `wps-office-cn` from AUR (provides `/bin/wps`)
- `fcitx5` input method framework installed and running

**Usage (requires root):**
```bash
sudo ./wps_office/wps_im.sh
```

The script inserts the environment variables after line 2 of `/bin/wps` (after the shebang and comment line). It checks if the variables already exist before inserting and requires root to modify `/bin/wps`.
