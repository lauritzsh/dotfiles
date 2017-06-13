call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'derekwyatt/vim-scala'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mustache/vim-mustache-handlebars'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'

call plug#end()

" Basyc syntax highlighting and indentation
filetype plugin indent on
syntax on

" Use easier leader key
let mapleader=","

" Use real line number for current cursor line
set number
" Use relative numbers for other lines
set relativenumber

" Two spaces for indentation
set shiftwidth=2
set softtabstop=2
set expandtab

" Stops NVim from complaining when hitting Escape in normal mode for example
set visualbell

" Character column wall
set colorcolumn=80

" Will display tabs and trailing spaces
set list listchars=tab:»·,trail:·

" Copy to/paste from OS clipboard
set clipboard=unnamed

" Such as s/search/replace/g
set gdefault

" Case insensitive searches
set ignorecase

" Easily disable current search highlighting
nnoremap <esc> :noh<return><esc>

" Move cursor to new split pane
set splitbelow
set splitright

" Theme for NVim
set background=dark
colorscheme base16-tomorrow

" Setup persistent undo
silent! call mkdir(expand('~/.config/nvim/backups'), 'p')
set undodir=~/.config/nvim/backups
set undofile

" vim-airline
let g:airline_powerline_fonts = 1

" Markdown
autocmd FileType markdown setlocal spell textwidth=100 colorcolumn=100
autocmd FileType markdown let g:airline_section_warning=' '

" Text
autocmd FileType text setlocal spell textwidth=100 colorcolumn=100

" Neomake
autocmd! BufWritePost * Neomake

" TypeScript
let g:neomake_typescript_enabled_makers = []
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" Marko
au BufNewFile,BufRead *.marko set filetype=mustache

" UltiSnips
set runtimepath+=~/.config/nvim
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
