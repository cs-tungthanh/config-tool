# config-tool

## Install zsh 
```bash
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
```
## Install Zsh plugin

```bash 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
```
Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
```
plugins=(z git zsh-autosuggestions zsh-syntax-highlighting)
```
---
## ZSH THEME
```bash 
curl -o ~/.oh-my-zsh/themes/myTheme.zsh-theme https://raw.githubusercontent.com/cs-tungthanh/config-tool/main/myTheme
```

-  Change `ZSH_THEME` in `.zshrc` file:
```
ZSH_THEME="myTheme"
```

---
## Tmux
- Install `Tmux` 
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install tmux
```
Customize shorcut in Tmux
```
curl -o ~/.tmux.conf https://raw.githubusercontent.com/cs-tungthanh/config-tool/main/tmux.conf
```
## Install Terminator
- Create file config: `vim ~/.config/terminator/config`

```
[global_config]
[keybindings]
[profiles]
  [[default]]
    cursor_color = "#aaaaaa"
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
      size = 1300, 800
      position = 0:0
    [[[child1]]]
      type = Terminal
      parent = window0
      profile = default
[plugins]
```
---
## Install and set theme for vim editor
```
curl -o ~/.vimrc https://raw.githubusercontent.com/cs-tungthanh/config-tool/main/vimrc.conf
```

