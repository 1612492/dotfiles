#!/bin/sh
#Clone config to home directory
rm -rf ~/.config
cp -R .config ~
rm ~/.tmux.conf ~/.zshenv
cp {.tmux.conf,.zshenv} ~
