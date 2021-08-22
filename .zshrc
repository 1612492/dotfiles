export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export TERMINAL=alacritty
export PROMPT_EOL_MARK=''
export LANG=en_US.UTF-8

export PATH=$PATH:$HOME/Dev/flutter/bin
export PATH=$PATH:/usr/local/go/bin

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

ZSH_THEME="robbyrussell"
plugins=(
  asdf
  vi-mode
  zsh-autosuggestions
)

alias t='tmux'
alias v='nvim'
alias dj='tmuxinator start ts dj_web'

source $ZSH/oh-my-zsh.sh
