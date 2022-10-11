# Setup of a new Ubuntu installation

This repo contains config files (dotfiles) and installation instructions to set up a clean new Ubuntu installation with
tools I need for my customized workflow.

Most importantly:

* i3 as tiling window manager
* zsh as shell
* tmux as session manager
* neovim config tuning and vim keybindings for JetBrains IDEs
* Obsidian as note-taking tool

## Prerequisites

It is assumed that you have experience with UNIX based operating systems.
It is assumed that these things have been set up before starting:

* Git is set up and this repository has been cloned.
* You have set up the editor/IDE of your choice. I will use JetBrains IntelliJ IDEA.

## Setting up IdeaVim bindings

__Note:__ This step is only necessary if you use IntelliJ with the IdeaVim plugin.

```bash
# Create directory to backup existing config files
mkdir -p ~/dotfiles-backup
[-f ~/.ideavimrc] && mv ~/.ideavimrc ~/dotfiles-backup/.ideavimrc
ln -s "$(pwd)/src/ideavim/.ideavimrc" ~/.ideavimrc
```

## Setting up password-less sudo

```bash
# Edit sudo settings
sudo visudo

# Change line 
# %sudo   ALL=(ALL:ALL) ALL
# to
# %sudo   ALL=(ALL:ALL) NOPASSWD:ALL
```

## Tuning the shell

```bash

sudo apt install zsh curl tmux xclip
chsh -s $(which zsh)

# Log out and in again for the effects to take place

# Install oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install and use powerlevel10k theme
# https://github.com/romkatv/powerlevel10k#installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set up zsh config
mkdir -p ~/dotfiles-backup
[ -f ~/.zshrc ] && mv ~/.zshrc ~/dotfiles-backup/.zshrc
ln -s "$(pwd)/src/zsh/.zshrc" ~/.zshrc

# Set up zsh aliases
mkdir -p ~/dotfiles-backup
[ -f ~/.zsh_aliases ] && mv ~/.zsh_aliases ~/dotfiles-backup/.zsh_aliases
ln -s "$(pwd)/src/zsh/.zsh_aliases" ~/.zsh_aliases

# Set up zsh functions
mkdir -p ~/dotfiles-backup
[ -f ~/.zsh_functions ] && mv ~/.zsh_functions ~/dotfiles-backup/.zsh_functions
ln -s "$(pwd)/src/zsh/.zsh_functions" ~/.zsh_functions

# Set up tmux config
mkdir -p ~/dotfiles-backup
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/dotfiles-backup/.tmux.conf
ln -s "$(pwd)/src/tmux/.tmux.conf" ~/.tmux.conf

# Set up fzf as fuzzy finder
# https://github.com/junegunn/fzf#installation
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Setting up i3

```bash
sudo apt install i3 i3blocks feh

# Set up i3 config
mkdir -p ~/dotfiles-backup
mv ~/.config/i3 ~/dotfiles-backup
mkdir -p ~/.config/i3/i3blocks/battery
mkdir -p ~/.config/i3/i3blocks/cpu
ln -s "$(pwd)/src/i3/config" ~/.config/i3/config
ln -s "$(pwd)/src/i3/i3blocks/config" ~/.config/i3/i3blocks/config
ln -s "$(pwd)/src/i3/i3blocks/cpu/cpu_info.sh" ~/.config/i3/i3blocks/cpu/cpu_info.sh
```

## Switching capslock and escape for better VIM experience

```bash
echo "setxkbmap -option caps:swapescape" >> ~/.profile
```

## Configuring git

```bash
# Set up git config
mkdir -p ~/dotfiles-backup
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/dotfiles-backup/.gitconfig
ln -s "$(pwd)/src/git/.gitconfig" ~/.gitconfig
```

## Miscellaneous

```bash
# Enable better bluetooth control
sudo apt install blueman 

# Enable better sound controls
sudo apt install pavucontrol
```

