# My profile

Since multiple computers often use Linux, and each configuration cannot be synchronized and each computer has a variety of styles,
this repository was created to store your favorite Linux-optimized configurations.

For more information on installation, please click [jump](#jump1)

Override configurations can be overridden using scripts or manually

### Use scripts

```shell
mkdir -p ~/WorkingDocument/
git clone https://github.com/NichloasChiu/profile.git ~/WorkingDocument/
cd ~/WorkingDocument/profile/
chmod +x OverrideConf.sh
./OverrideConf.sh
```

#### Use the latest configuration

1.  Clone the latest configuration file

    ```shell
    mkdir -p ~/WorkingDocument/
    git clone https://github.com/NichloasChiu/profile.git ~/WorkingDocument/profile/
    ```

2.  Back up your historical configurations

    - zsh

      ```shell
      cp ~/.zshrc /tmp/zshrc.bak
      ```

    - zsh themes

      ```shell
      cp ~/.p10k.zsh /tmp/p10k.zsh.bak
      ```

    - .tmux

      ```shell
      cp ~/.tmux.conf.local /tmp/tmux.conf.local.bak
      ```

3.  Overwrite your historical configuration

    - zsh

      ```shell
      cp ~/WorkingDocument/profile/zsh/.zshrc ~/.zshrc
      ```

    - zsh themes

      ```shell
      cp ~/WorkingDocument/profile/zsh/.p10k.zsh ~/.p10k.zsh
      ```

    - ohmytmux

      ```shell
      # Install plugins
      # git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
      git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/resurrect
      cp ~/WorkingDocument/profile/tmux/.tmux.conf.local ~/.tmux.conf.local
      ```

    - alacritty

      ```shell
      # Install fonts
      sudo pacman -S nerd-fonts-jetbrains-mono
      # configuration alacritty
      cp -r ~/WorkingDocument/profile/alacritty ~/.config/
      # Install tmux-256color(Execute the command in the ~/.config/alacritty directory)
      sudo /usr/bin/tic -xe tmux-256color terminfo.src
      ```

---

# Update the configuration file

```shell
sudo chmod +x ~/WorkingDocument/profile/UpdateConf.sh
sh ~/WorkingDocument/profile/UpdateConf.sh
```

---

# <span id="jump1">**Install**</span>

#### Install zsh

1.  **View the shells installed on the system and the current shells**

    ```shell
    -> cat /etc/shells
    # /etc/shells: valid login shells
    /bin/sh
    /bin/bash
    /bin/rbash
    /bin/dash
    /bin/zsh
    /usr/bin/zsh
    -> echo $SHELL
    /usr/bin/zsh
    ```

2.  **Install zsh**

    ```shell
    # ubuntu
    sudo apt update
    sudo apt install zsh -y
    # arch
    sudo pacman -S zsh
    ```

3.  **Set ZSH as the default shell**

    ```shell
    chsh -s /bin/zsh
    echo $SHELL
    ```

#### Install oh-my-zsh

1.  **Install it according to the command of the Oh-My-Zsh Gitlab repository WiKi or [the official website](https://ohmyz.sh/)**

    ```shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

2.  **topic**  
    Oh-My-Zsh has a lot of themes installed by default, which is located in the directory .oh-my-zsh/themes.
    You can set the theme in the zsh configuration file ~/.zshrc to your favorite theme name

    ```shell
    # Install powerlevel10k topic
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    # vim ~/.zshrc
    ZSH_THEME="powerlevel10k/powerlevel10k”
    # disposition powerlevel10k
    p10k configure
    ```

3.  **Configure the plugin**  
    The default installed plugin is located at the path .oh-my-zsh/plugins/.
    The plugin configuration can be done through the plugins in the zsh configuration file ~/.zshrc

    ```shell
    plugins=(zsh-syntax-highlighting
             zsh-autosuggestions
             git
             autojump
             extract
            )
    ```

    - Install zsh-syntax-highlighting to name highlighting

      ```shell
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
      ```

    - Install the zsh-autosuggestions command to complete  
      When you enter a command, you can prompt autocomplete (gray part), and then the right arrow key can be completed

      ```shell
      git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
      ```

    - Git operation acceleration: git  
      The main thing is to provide a lot of alias, shorthand for many commonly used git commands. By command alias | grep git, no installation required

    - Install the autojump directory jump

      ```shell
      apt-get install autojump
      ```

    - extract

    - **Configure the plugin**  
      Because oh-my-zsh will check the various states of git when entering the git directory, it will be significantly slower when jumping, and you can use the following command to configure the check function to be disabled
      ```shell
      git config --global oh-my-zsh.hide-status 1
      git config --global oh-my-zsh.hide-dirty 1
      ```

#### Install.tmux

```shell
# ubuntu Install tmux
apt-get install tmux
# arch Install tmux
sudo pacman -S tmux
# Install.tmux(oh my tmux)
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

#### Install neofetch

```shell

# ubuntu
apt install neofetch
# arch
sudo pacman -S neofetch
```

---

#### Install alacritty

```shell
sudo pacman -S alacritty
```

For manual installation, refer to [alacritty-github](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

---

#### Install joshuto

```shell
sudo pacman -S joshuto
```
