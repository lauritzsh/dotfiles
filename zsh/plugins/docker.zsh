alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'

function dme() {
  eval "$(docker-machine env $1)"
}
