" Better indentation
vnoremap < <gv
vnoremap > >gv

" Map sort function to key
vnoremap <leader>ss :sort<CR>
" For sorting plugins
vnoremap <leader>sp :sort i :.\{-}/:<CR>

" Format the entire file
nmap <leader>fef ggVG=``zz

" Use arrow keys to switch windows
noremap <C-k> <c-w>k
noremap <C-j> <c-w>j
noremap <C-l> <c-w>l
noremap <C-h> <c-w>h

" Easy increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Change GoldenView keybinding
let g:goldenview__enable_default_mapping = 0
" nmap <silent> <C-k> <Plug>GoldenViewSplit

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

" Easy folding
nnoremap <Space> za
