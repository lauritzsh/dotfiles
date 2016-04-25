#!/usr/bin/env zsh

# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Aliases
alias reload="exec $SHELL -l"
alias c='clear'

alias mkdir='mkdir -p'
alias mk='mkdir -p'
alias l='ls -lhF --color'
alias la='ls -lhAF --color'

alias vi='nvim'
alias vim='nvim'

# Functions
function mcd() {
  mkdir -p "$1" && cd "$1";
}

function o() {
  if [[ $# > 0 ]]; then
    open $@
  else
    open .
  fi
}

function dot() {
  if [[ "$#" == 0 ]]; then
    cat <<HELP
Options:
  brew   -- Upgrades brew formulae
    skip -- Skip updates
HELP
  fi

  if [[ "$1" == "brew" ]]; then
    if [[ "$2" != "skip" ]]; then
      brew update
    fi
    brew upgrade --all
    brew cleanup
    brew cask cleanup
  fi
}
