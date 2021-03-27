#!/bin/sh
#Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#ZSH Autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#Brew formulae, casks
brew install $(cat brew.txt)
brew install --cask $(cat brew.cask.txt)
#Clone config to home directory
cp -R .config ~
cp {.tmux.conf,.zshenv} ~
