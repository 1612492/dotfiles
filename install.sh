#!/bin/bash

DOTFILES_REPO_URL="https://github.com/1612492/dotfiles.git"
DOTFILES_DIR=~/dotfiles

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles repository not found. Cloning it from $DOTFILES_REPO_URL..."
  git clone "$DOTFILES_REPO_URL" "$DOTFILES_DIR"
else
  echo "Dotfiles repository already exists."
fi

echo "Creating symbolic links..."
ln -s "$DOTFILES_DIR/kitty" ~/.config/kitty
ln -s "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -s "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
ln -s "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

echo "Setup successfully."
