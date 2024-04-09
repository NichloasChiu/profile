#!/bin/bash
###########################################################################################################
# File Name:    OverrideConf.sh
# Author:       NichloasChiu
# mail:         NichloasChiu@outlook.com
# Created Time: 2024年02月22日 星期四 15时55分36秒
##########################################################################################################
CONFPATH="/home/nichloaschiu/WorkingDocument/profile"
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

cp -f $CONFPATH/zsh/.zshrc ~/.zshrc
if_mycmd

cp -f $CONFPATH/zsh/.p10k.zsh ~/.p10k.zsh
if_mycmd

# Install plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if [ ! -e $HOME/.tmux/plugins/resurrect ]; then
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/resurrect
fi
if_mycmd
sleep 10

cp -f $CONFPATH/tmux/.tmux.conf.local ~/.tmux.conf.local

cp $CONFPATH/alacritty/ -rf ~/.config/

cp -rf $CONFPATH/joshuto/ ~/.config/

# Discard, replace it with UTOOLS
#
# cp -f $CONFPATH/ulauncher/init.trans ~/.translate-shell
# if_mycmd

neofetch | lolcat >/dev/null 2>&1
if [ $? -ne 0 ]; then
	sudo pacman -S lolcat --noconfirm
fi

cp -f $CONFPATH/neofetch/config.conf ~/.config/neofetch/
if_mycmd

unzip $CONFPATH/firefox/WhiteSur-gtk-theme-master.zip -d $CONFPATH/firefox/
if_mycmd

if pgrep -x "firefox" >/dev/null; then
	pkill firefox
else
	chmod +x $CONFPATH/firefox/WhiteSur-gtk-theme-master/tweaks.sh
	sh $CONFPATH/firefox/WhiteSur-gtk-theme-master/tweaks.sh -f
	if_mycmd
fi

rm -rf $CONFPATH/firefox/WhiteSur-gtk-theme-master
if_mycmd
