# dotfiles
## Installation
The order is important for some of these steps, so please consider following that.

  * `./tasks homebrew`
  * `./tasks symlink`
  * `./tasks change_shell`
  * `git submodule update --init`
  * Quit Terminal and use iTerm
  * `./tasks plug`

Now the necessary programs and applications should be installed.

  * Open `iterm2` directory and install colors
  * Open `fonts` directory and install fonts
  * Change colors and fonts for iTerm
    * For iTerm disable "Draw bold text in bright colors" under Profiles > Text
    * Choose the new font under Profiles > Text and set size to 13

For configuring NeoVim we will just open `vim` (an alias for `nvim`) and type `:PlugInstall`.  
Also remember to run `pip install --user --upgrade neovim` for getting some Python modules working.

To get some more sane settings for the OS we can run the `osx` script under the `osx` directory.

  * `./osx/osx`
