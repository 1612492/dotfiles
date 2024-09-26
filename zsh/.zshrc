ZSH_THEME="robbyrussell"
plugins=(
  asdf
  vi-mode
  zsh-autosuggestions
)

alias v='nvim'

export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim

export path=(
  $path
  /usr/local/bin
  $HOME/.cargo/bin
)

source $ZSH/oh-my-zsh.sh
