ZSH_THEME="robbyrussell"
plugins=(
  asdf
  vi-mode
  zsh-autosuggestions
)

alias v='nvim'

export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export ANDROID_HOME=$HOME/Library/Android/sdk

export path=(
  $path
  /usr/local/bin
  /usr/local/flutter/bin
  $GOROOT/bin
  $GOPATH/bin
  $ANDROID_HOME/emulator
  $ANDROID_HOME/platform-tools
)

source $ZSH/oh-my-zsh.sh
