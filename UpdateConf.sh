#!/bin/bash
###########################################################################################################
# File Name:    test.sh
# Author:       NichloasChiu
# mail:         NichloasChiu@outlook.com
# Created Time: Thu 10 Jul 2025 04:02:26 AM EDT
##########################################################################################################
set -e # Exit immediately if a command fails

# Define the root directory where profile configs are stored
PROFILE_PATH="$HOME/WorkingDocument/profile"

# Logging helpers
log_info() { echo -e "\033[1;32m[INFO]\033[0m $1"; }
log_err() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
  exit 1
}

# Wrapper for safe copy
safe_copy() {
  local src=$1
  local dst=$2
  cp -f "$src" "$dst" && log_info "Copied: $src -> $dst" || log_err "Failed to copy $src to $dst"
}

# Wrapper for safe directory copy (recursively)
safe_copy_dir() {
  local src_dir=$1
  local dst_dir=$2
  mkdir -p "$dst_dir"
  cp -rf "$src_dir"/* "$dst_dir"/ && log_info "Copied dir: $src_dir -> $dst_dir" || log_err "Failed to copy dir $src_dir to $dst_dir"
}

log_info "Starting update of profile configurations..."

# Copy individual config files
safe_copy "$HOME/.zshrc" "$PROFILE_PATH/zsh/.zshrc"
safe_copy "$HOME/.p10k.zsh" "$PROFILE_PATH/zsh/.p10k.zsh"
safe_copy "$HOME/.tmux.conf.local" "$PROFILE_PATH/tmux/.tmux.conf.local"

# Copy config directories from ~/.config to profile
safe_copy_dir "$HOME/.config/alacritty" "$PROFILE_PATH/alacritty"
safe_copy_dir "$HOME/.config/joshuto" "$PROFILE_PATH/joshuto"

# Copy single file from neofetch config
safe_copy "$HOME/.config/neofetch/config.conf" "$PROFILE_PATH/neofetch/config.conf"

log_info "✅ All user configurations have been saved to profile directory."
