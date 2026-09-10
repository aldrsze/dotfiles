" FZF keymaps 

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fq :Clist<CR>
nnoremap <leader>fh :Helptags<CR>

" Grep current string
nnoremap <leader>fs :Rg <C-r><C-w><CR>

" Grep input string (fzf prompt)
nnoremap <leader>fg :Rg<Space>

" Grep for current file name (without extension)
nnoremap <leader>fc :execute 'Rg ' . expand('%:t:r')<CR>

" Find files in your vim config
nnoremap <leader>fi :Files ~/.vim<CR>

" ---- fzf window ergonomics --------------------------------------------------
" fzf.vim runs the picker in a :terminal buffer (filetype 'fzf'). By default,
" the first <Esc> just leaves Vim's terminal-mode (back to Normal mode over
" the terminal buffer) instead of reaching fzf itself - only the *second*
" <Esc> actually gets sent to fzf and closes it. These tnoremaps bypass that:
" they fire while still in terminal-mode, so the key goes straight to fzf.

" Quit with a single 'q' - sends Ctrl-C, which fzf's default bindings treat
" as abort. Trade-off: you can no longer type a literal 'q' into the search
" query, same as how netrw/quickfix use 'q' to close.
autocmd FileType fzf tnoremap <buffer> q <C-c>

" Move through the result list and edit the query with Ctrl+h/j/k/l, mirroring
" normal-mode motions. Plain h/j/k/l are left alone so they still type
" normally into the fuzzy-search query.
autocmd FileType fzf tnoremap <buffer> <C-j> <Down>
autocmd FileType fzf tnoremap <buffer> <C-k> <Up>
autocmd FileType fzf tnoremap <buffer> <C-h> <Left>
autocmd FileType fzf tnoremap <buffer> <C-l> <Right>

