set termguicolors

set background=dark
let g:gruvbox_contrast_dark = 'hard'
" dark custom indent
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#32302f ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3836 ctermbg=237

" set background=light
" let g:gruvbox_contrast_light = 'soft'
" " light custom indent
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#f2e5bc ctermbg=229
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#ebdbb2 ctermbg=223

colorscheme gruvbox

" --- Vim Indent Guides Configuration ---
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Disable auto-colors so you can set custom subtle shades matching tir_black
let g:indent_guides_auto_colors = 0


