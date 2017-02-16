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
  brew -- Upgrades brew formulae
HELP
  fi

  if [[ "$1" == "brew" ]]; then
    brew upgrade
    brew cleanup
    brew cask cleanup
  fi
}

function flac2mp3() {
  find "$1" -iname "*.flac" -exec \
    ffmpeg -i {} -acodec libmp3lame -ab 320k {}.mp3 \
  \;

  if [[ "$2" == '-d' || "$2" == '--delete' ]]; then
    find "$1" -iname "*.flac" -exec trash {} \;
  fi
}
