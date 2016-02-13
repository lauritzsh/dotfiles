#!/usr/bin/env bash

homebrew() {
  echo "Installing Homebrew"
  echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null

  brew tap Homebrew/bundle &> /dev/null
  brew bundle &> /dev/null
}

symlink() {
  echo "Symlinking files and folders"
  _symlink 'emacs.d'
  _symlink 'git/gitconfig'
  _symlink 'git/gitignore'
  _symlink 'lein'
  _symlink 'ruby/gemrc'
  _symlink 'ruby/rspec'
  _symlink 'tmux/tmux.conf'
  _symlink 'vim'
  _symlink 'vim/vimrc'
  _symlink 'zsh/zshenv'
  _symlink 'zsh/zshrc'
}

neobundle() {
  echo "Installing NeoBundle"
  curl -s https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
  sh ./install.sh &> /dev/null
  rm install.sh
}

change_shell() {
  echo "Changin shell to Zsh"
  sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  chsh -s /usr/local/bin/zsh &> /dev/null
  echo "Changed shell"
}

# Private functions
_symlink() {
  source="$PWD/$1"
  target="$HOME/.$(basename $1)"

  # -e  existence
  # -L  symbolic link
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.backup"
  fi

  ln -nfs "$source" "$target"
}

if [ "$#" -eq 0 ] || [ "$1" == "-h" ]; then
  cat <<HELP
Usage:
  homebrew     -- Install Homebrew and packages
  symlink      -- Symlink dotfiles to \$HOME
  neobundle    -- Install NeoBundle for Vim
  change_shell -- Changes shell to Zsh
HELP
else
  # Poor man's task runner
  "$@"
fi
