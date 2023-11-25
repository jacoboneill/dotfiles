#!/bin/bash

# Navigate to $HOME
cd $HOME;

# Install Homebrew and Packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/jacoboneill/.zprofile
eval "$(/usr/local/bin/brew shellenv)" &&
ln -fs ~/.config/homebrew/Brewfile ~/Brewfile &&
brew bundle install;

# Symlink
ln -fs ~/.config/git/.gitconfig ~/.gitconfig
ln -fs ~/.config/zsh/.p10k.zsh ~/.p10k.zsh
ln -fs ~/.config/zsh/.zshrc ~/.zshrc
