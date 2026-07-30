#!/usr/bin/env bash
# Configs installation script
# Copies configs to appropriate locations if target directories exist

set -euo pipefail

CONFIGS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $CONFIGS_DIR"

# git config - always copy to ~/.config/git/config
GIT_CONFIG_DIR="$HOME/.config/git"
mkdir -p "$GIT_CONFIG_DIR"
echo "Copying git/config to $GIT_CONFIG_DIR/config"
cp "$CONFIGS_DIR/git/config" "$GIT_CONFIG_DIR/config"

# mpv config - copy if ~/.config/mpv exists
MPV_TARGET="$HOME/.config/mpv"
if [[ -d "$MPV_TARGET" ]]; then
  echo "Found mpv config directory at $MPV_TARGET"
  echo "Copying mpv.conf to $MPV_TARGET/mpv.conf"
  cp "$CONFIGS_DIR/mpv/mpv.conf" "$MPV_TARGET/mpv.conf"
else
  echo "mpv config directory not found at $MPV_TARGET, skipping mpv config"
fi

# RIME config - copy if ~/.local/share/fcitx5/rime exists
RIME_TARGET="$HOME/.local/share/fcitx5/rime"
if [[ -d "$RIME_TARGET" ]]; then
  echo "Found RIME config directory at $RIME_TARGET"
  echo "Copying RIME configs to $RIME_TARGET/"
  cp "$CONFIGS_DIR/RIME/"*.yaml "$RIME_TARGET/"
else
  echo "RIME config directory not found at $RIME_TARGET, skipping RIME configs"
fi

echo "Done!"
