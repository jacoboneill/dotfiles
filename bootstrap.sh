#!/bin/bash
clear;

# Navigate to $HOME
cd $HOME;

# Install Homebrew and Packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/jacoboneill/.zprofile &&
eval "$(/usr/local/bin/brew shellenv)" &&
ln -fs ~/.config/homebrew/Brewfile ~/Brewfile &&
brew bundle install;

# Symlink
ln -fs ~/.config/git/.gitconfig ~/.gitconfig;
ln -fs ~/.config/homebrew/Brewfile ~/Brewfile;
ln -fs ~/.config/tmux/.tmux.conf ~/.tmux.conf;
ln -fs ~/.config/zsh/.p10k.zsh ~/.p10k.zsh;
ln -fs ~/.config/zsh/.zshrc ~/.zshrc;

# Dock
brew install --cask hpedrorodrigues/tools/dockutil;

dockutil --list | awk -F'file:' '{print $1}' | while read -r FILE; do
  dockutil -r "$FILE" --no-restart
done

dockutil -a /Applications/Google\ Chrome.app/ --no-restart;
dockutil -a /Applications/Spotify.app/ --no-restart;
dockutil -a /Applications/Obsidian.app/ --no-restart;
dockutil -a /Applications/Alacritty.app/ --no-restart;
dockutil -a ~/Downloads/ --display stack --restart;

brew uninstall --cask dockutil;
brew autoremove;

# Install ZSH Themes and Plugins
ZSH_CUSTOM="$HOME/.config/zsh/.oh-my-zsh";
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Restart ZSH
zsh
