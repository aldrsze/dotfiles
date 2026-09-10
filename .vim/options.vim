set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
set relativenumber
set smartindent
set showmatch
set noshowmode
set backspace=indent,eol,start
set wrap
set mouse=a
packadd comment

" Change cursor shape based on mode
let &t_SI = "\e[6 q" " SI = Insert mode (vertical bar)
let &t_SR = "\e[4 q" " SR = Replace mode (underline)
let &t_EI = "\e[2 q" " EI = Normal mode (block)

set signcolumn=yes
set completeopt=menuone,noinsert,noselect
