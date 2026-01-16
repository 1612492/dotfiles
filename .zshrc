ZSH_THEME="robbyrussell"
plugins=(
  mise
  vi-mode
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)

alias v='nvim'

export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

source $ZSH/oh-my-zsh.sh
