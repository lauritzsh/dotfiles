" Git
autocmd BufRead,BufNewFile gitconfig* set filetype=gitconfig
autocmd FileType gitconfig setlocal noexpandtab shiftwidth=4 softtabstop=4

" Markdown
autocmd FileType markdown setlocal spell textwidth=100 colorcolumn=100
autocmd filetype markdown let g:airline_section_warning=' '

" JavaScript
autocmd BufRead,BufNewFile *.jsx     setlocal filetype=javascript.jsx
autocmd BufRead,BufNewFile .babelrc  setlocal filetype=json
autocmd BufRead,BufNewFile .bowerrc  setlocal filetype=json
autocmd BufRead,BufNewFile .eslintrc setlocal filetype=json
autocmd BufRead,BufNewFile .jshintrc setlocal filetype=json

" (S)CSS
autocmd FileType css  setlocal shiftwidth=4 softtabstop=4
autocmd FileType scss setlocal shiftwidth=4 softtabstop=4

" LaTeX
autocmd BufRead,BufNewFile *.tex setlocal filetype=tex

" Go
autocmd BufRead,BufNewFile *.go setlocal noexpandtab shiftwidth=4 softtabstop=4
