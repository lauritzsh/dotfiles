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

alias f='ag -g'
alias r='ag'

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

function ogg2mp3 () {
  find "$1" -iname "*.ogg" -exec ffmpeg -i {} -acodec libmp3lame -ab 320k {}.mp3 \;
  if [[ "$2" == '-d' || "$2" == '--delete' ]]
  then
    find "$1" -iname "*.ogg" -exec trash {} \;
  fi
}

function cut () {
  if [ "$1" = "-h" ]; then
    echo "usage: $0 input from to name [where]"

    return
  fi

  FILE_PATH=$(dirname "$1")
  FILE_NAME=$(basename "$1")
  FILE_EXT="${FILE_NAME##*.}"
  # FILE_NAME="${FILE_NAME%.*}"

  if [ "$FILE_EXT" = "mp4" ]; then
    ffmpeg -i "$1" -ss "$2" -to "$3" -c copy "${5:-$FILE_PATH}/$4-$FILE_NAME"
  else
    ffmpeg -i "$1" -ss "$2" -to "$3" -c:v libx264 -c:a aac -strict experimental -b:a 128k "$FILE_PATH/$4-$FILE_NAME.mp4"
  fi
}
