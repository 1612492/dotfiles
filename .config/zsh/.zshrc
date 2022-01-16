export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export TERMINAL=kitty
export PROMPT_EOL_MARK=''
export LANG=en_US.UTF-8

export PATH=$PATH:$HOME/.asdf/installs/rust/stable/bin

ZSH_THEME="robbyrussell"
plugins=(
  asdf
  vi-mode
  tmux
  zsh-autosuggestions
)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf

alias v='nvim'

source $ZSH/oh-my-zsh.sh
