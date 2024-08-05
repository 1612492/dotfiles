#!/bin/bash

DOTFILES_REPO_URL="https://github.com/1612492/dotfiles.git"
DOTFILES_DIR=~/dotfiles

if [ ! -d "$DOTFILES_DIR" ]; then
  git clone "$DOTFILES_REPO_URL" "$DOTFILES_DIR"
fi

ln -sf "$DOTFILES_DIR/kitty" ~/.config
ln -sf "$DOTFILES_DIR/nvim" ~/.config
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

if [ ! -d ~/.tmux/plugins ]; then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  tmux source-file ~/.tmux.conf
  ~/.tmux/plugins/tpm/bin/install_plugins
fi

echo "Setup successfully."
