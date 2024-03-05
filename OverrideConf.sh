#!/bin/bash
###########################################################################################################
# File Name:    OverrideConf.sh
# Author:       NichloasChiu
# mail:         NichloasChiu@outlook.com
# Created Time: 2024年02月22日 星期四 15时55分36秒
##########################################################################################################
if_mycmd() {
	if [ $? -ne 0 ]; then
		echo "The script exits, and an unexpected situation occurs, please configure it manually"
		exit
	fi
}

if [ ! -e $HOME/WorkingDocument/ ]; then
	mkdir -p ~/WorkingDocument/
fi

cp -f ~/.zshrc /tmp/zshrc.bak
if_mycmd

if [ -e ~/.p10k.zsh ]; then
	cp -f ~/.p10k.zsh /tmp/p10k.zsh.bak
	if_mycmd
fi

cp -f ~/.tmux.conf.local /tmp/tmux.conf.local.bak
if_mycmd

# StartConfiging

cp -f ~/WorkingDocument/profile/zsh/.zshrc ~/.zshrc
if_mycmd

cp -f ~/WorkingDocument/profile/zsh/.p10k.zsh ~/.p10k.zsh
if_mycmd

# Install plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/resurrect
if_mycmd
sleep 10

cp -f ~/WorkingDocument/profile/tmux/.tmux.conf.local ~/.tmux.conf.local

cp ~/WorkingDocument/profile/alacritty/ -rf ~/.config/

cp -rf ~/WorkingDocument/profile/joshuto/ ~/.config/

cp -f ~/WorkingDocument/profile/ulauncher/init.trans ~/.translate-shell
if_mycmd

neofetch | lolcat >/dev/null 2>&1
if [ $? -ne 0 ]; then
	sudo pacman -S lolcat --noconfirm
fi
