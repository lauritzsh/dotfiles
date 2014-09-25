#!/usr/bin/env zsh
# Starts a local webserver for the current directory
# It defaults to 3000 but it's possible to change:
#
#   serve 5000

function serve {
  port="${1:-3000}"
  ruby -run -e httpd . -p "$port"
}
