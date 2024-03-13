#!/bin/bash
###########################################################################################################
# File Name:    UpdateConf.sh
# Author:       NichloasChiu
# mail:         NichloasChiu@outlook.com
# Created Time: 2024年02月22日 星期四 16时47分47秒
##########################################################################################################

if_mycmd() {
	if [ $? -ne 0 ]; then
		echo "The script exits, and an unexpected situation occurs, please configure it manually"
		exit
	fi
}

cp ~/.zshrc -f ~/WorkingDocument/profile/zsh/.zshrc
if_mycmd
cp ~/.p10k.zsh -f ~/WorkingDocument/profile/zsh/.p10k.zsh
if_mycmd
cp ~/.tmux.conf.local -f ~/WorkingDocument/profile/tmux/.tmux.conf.local
if_mycmd
cp ~/.config/alacritty/ -rf ~/WorkingDocument/profile/
if_mycmd
cp ~/.config/joshuto/ -rf ~/WorkingDocument/profile/
if_mycmd
cp ~/.config/neofetch/config.conf -f ~/WorkingDocument/profile/neofetch/
if_mycmd
