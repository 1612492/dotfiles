export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  asdf
  git
  vi-mode
  zsh-autosuggestions
)

alias t='tmux'
alias v='nvim'
alias dj='tmuxinator start ts dj_web'

source $ZSH/oh-my-zsh.sh
