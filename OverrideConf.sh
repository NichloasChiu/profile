#!/bin/bash
###########################################################################################################
# File Name:    test.sh
# Author:       NichloasChiu
# mail:         NichloasChiu@outlook.com
# Created Time: Thu 10 Jul 2025 03:51:34 AM EDT
##########################################################################################################
set -e # Exit immediately if a command exits with a non-zero status

# Define paths
CONFIG_ROOT="/home/nichloaschiu/WorkingDocument/profile"
ZSHRC="$HOME/.zshrc"
P10K="$HOME/.p10k.zsh"
TMUXCONF="$HOME/.tmux.conf.local"

# Colored logging functions
log_info() { echo -e "\033[1;32m[INFO]\033[0m $1"; }
log_err() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
  exit 1
}

# Function: Safe copy with error handling
safe_copy() {
  cp -f "$1" "$2" || log_err "Failed to copy $1 to $2"
}

# Function: Backup a file if it exists
backup_file() {
  [ -f "$1" ] && cp -f "$1" "$2" && log_info "Backup: $1 -> $2"
}

log_info "Backing up old config files..."

# Backup existing configuration files
backup_file "$ZSHRC" "/tmp/zshrc.bak"
[ -f "$P10K" ] && backup_file "$P10K" "/tmp/p10k.zsh.bak"
backup_file "$TMUXCONF" "/tmp/tmux.conf.local.bak"

log_info "Overriding config files with predefined profiles..."

# Override with custom configuration files
safe_copy "$CONFIG_ROOT/zsh/.zshrc" "$ZSHRC"
safe_copy "$CONFIG_ROOT/zsh/.p10k.zsh" "$P10K"
safe_copy "$CONFIG_ROOT/tmux/.tmux.conf.local" "$TMUXCONF"

# Clone tmux-resurrect plugin if not already present
log_info "Ensuring tmux-resurrect plugin is installed..."
if [ ! -d "$HOME/.tmux/plugins/resurrect" ]; then
  git clone https://github.com/tmux-plugins/tmux-resurrect "$HOME/.tmux/plugins/resurrect"
fi

# Copy application-specific configurations to ~/.config
log_info "Deploying configurations to ~/.config directory..."

mkdir -p ~/.config/{alacritty,joshuto,neofetch}

cp -rf "$CONFIG_ROOT/alacritty/"* ~/.config/alacritty/
cp -rf "$CONFIG_ROOT/joshuto/"* ~/.config/joshuto/
cp -f "$CONFIG_ROOT/neofetch/config.conf" ~/.config/neofetch/

# Check and install lolcat if missing (used by neofetch)
log_info "Checking for 'lolcat' dependency..."
if ! command -v lolcat >/dev/null; then
  log_info "'lolcat' not found, installing via pacman..."
  sudo pacman -S lolcat --noconfirm
fi

log_info "✅ All configuration files have been successfully overridden."
