ZSH_THEME="robbyrussell"
plugins=(
  asdf
  vi-mode
  zsh-autosuggestions
)

alias v='nvim'

export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim

. ~/.asdf/plugins/golang/set-env.zsh

source $ZSH/oh-my-zsh.sh
