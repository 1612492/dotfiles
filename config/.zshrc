ZSH_THEME="robbyrussell"
plugins=(
  nvm
  vi-mode
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)

alias v='nvim'

export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim

source $ZSH/oh-my-zsh.sh
