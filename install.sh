#!/usr/bin/env bash
# Dotfiles installation script
# Copies configs to appropriate locations if target directories exist

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# git config - always copy
echo "Copying .gitconfig to $HOME/.gitconfig"
cp "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# mpv config - copy if ~/.config/mpv exists
MPV_TARGET="$HOME/.config/mpv"
if [[ -d "$MPV_TARGET" ]]; then
  echo "Found mpv config directory at $MPV_TARGET"
  echo "Copying mpv.conf to $MPV_TARGET/mpv.conf"
  cp "$DOTFILES_DIR/mpv/mpv.conf" "$MPV_TARGET/mpv.conf"
else
  echo "mpv config directory not found at $MPV_TARGET, skipping mpv config"
fi

# RIME config - copy if ~/.local/share/fcitx5/rime exists
RIME_TARGET="$HOME/.local/share/fcitx5/rime"
if [[ -d "$RIME_TARGET" ]]; then
  echo "Found RIME config directory at $RIME_TARGET"
  echo "Copying RIME configs to $RIME_TARGET/"
  cp "$DOTFILES_DIR/RIME/"*.yaml "$RIME_TARGET/"
else
  echo "RIME config directory not found at $RIME_TARGET, skipping RIME configs"
fi

echo "Done!"
