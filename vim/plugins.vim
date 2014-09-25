filetype off

set runtimepath+=/Users/Lauritz/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'chriskempson/base16-vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kongo2002/fsharp-vim'
NeoBundle 'zhaocai/GoldenView.Vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic', {'build':{'mac':'npm i -g eslint babel-eslint eslint-plugin-react'}}
NeoBundle 'bling/vim-airline'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fatih/vim-go'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'tpope/vim-surround'
NeoBundle 'darthmall/vim-vue'

NeoBundleLazy 'jelera/vim-javascript-syntax', {'filetypes':['javascript']}

call neobundle#end()

filetype plugin indent on
syntax on

NeoBundleCheck
