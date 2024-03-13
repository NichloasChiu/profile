# MyAlacrittyConfiguration

#### Install alacritty

```shell
sudo pacman -S alacritty
```

For manual installation, refer to [alacritty-github](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

#### Install fonts

```shell
sudo pacman -S nerd-fonts-jetbrains-mono
```

#### Pull configuration

```shell
git clone https://github.com/NichloasChiu/MyAlacrittyConfiguration.git ~/.config/alacritty
```

#### Install tmux-256color

Execute the command in the ~/.config/alacritty directory

```shell
sudo /usr/bin/tic -xe tmux-256color terminfo.src
```
