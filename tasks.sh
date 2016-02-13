#!/usr/bin/env bash

setup() {
  homebrew       && \
    symlink      && \
    neobundle    && \
    change_shell
}

homebrew() {
  echo "Installing Homebrew"
  echo | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null

  brew tap Homebrew/bundle &> /dev/null
  brew bundle # &> /dev/null
  _done
}

node() {
  echo -n "Installing Node"
  brew install nvm &> /dev/null
  mkdir -p ~/.nvm
  cp $(brew --prefix nvm)/nvm-exec ~/.nvm/
  source $(brew --prefix nvm)/nvm.sh
  nvm install node &> /dev/null
  nvm alias default node &> /dev/null
  _done
}
}

symlink() {
  echo -n "Symlinking files and folders"
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
  _done
}

neobundle() {
  echo -n "Installing NeoBundle"
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh &> /dev/null
  sh ./install.sh &> /dev/null
  rm -rf install.sh
  _done
}

change_shell() {
  echo "Changin shell to Zsh"
  sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  chsh -s /usr/local/bin/zsh &> /dev/null
  echo -n "Changed shell"
  _done
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

_done() {
  if [ $? -eq 0 ]; then
    echo -e " \e[32m\u2714\e[0m"
  else
    echo -e " \e[31m\u2718\e[0m"
  fi
}

if [ "$#" -eq 0 ] || [ "$1" == "-h" ]; then
  cat <<HELP
Usage:
  setup        -- Runs all scripts below
  homebrew     -- Install Homebrew and packages
  node         -- Install Node with nvm
  symlink      -- Symlink dotfiles to \$HOME
  neobundle    -- Install NeoBundle for Vim
  change_shell -- Changes shell to Zsh
HELP
else
  # Poor man's task runner
  "$@"
fi
