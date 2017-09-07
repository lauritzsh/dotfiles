#!/usr/bin/env zsh

# Aliases
alias ga='gist -p -s -a -P -t txt'
alias gta='gist -p -s -a -P -t'

alias gf!='git commit -v --amend --no-edit'
alias gfa!='git commit -a -v --amend --no-edit'

# Functions
function g() {
  if [[ $# > 0 ]]; then
    hub $@
  else
    hub status
  fi
}

function gi() {
  curl -s "https://www.gitignore.io/api/$@";
}
