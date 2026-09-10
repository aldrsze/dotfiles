" tell vimwiki to use markdown and set the folder path
let g:vimwiki_list = [{'path': '~/VimNotes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Prevent Vimwiki from taking over regular markdown files outside your wiki
let g:vimwiki_global_ext = 0

