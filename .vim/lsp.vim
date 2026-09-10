" Enable diagnostics highlighting
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [
      \ #{
      \   name: 'clangd',
      \   filetype: ['c', 'cpp'],
      \   path: 'clangd',
      \   args: ['--background-index', '--clang-tidy']
      \ },
      \ #{
      \   name: 'pyright',
      \   filetype: ['python'],
      \   path: 'pyright-langserver',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'typescript-language-server',
      \   filetype: ['javascript', 'javascriptreact'],
      \   path: 'typescript-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'vscode-html-languageserver',
      \   filetype: ['html'],
      \   path: 'vscode-html-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'vscode-css-languageserver',
      \   filetype: ['css', 'scss', 'less'],
      \   path: 'vscode-css-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'omnisharp',
      \   filetype: ['cs'],
      \   path: 'omnisharp',
      \   args: ['-lsp']
      \ },
      \ #{
      \   name: 'jdtls',
      \   filetype: ['java'],
      \   path: 'jdtls',
      \   args: []
      \ },
      \ #{
      \   name: 'marksman',
      \   filetype: ['markdown'],
      \   path: 'marksman',
      \   args: ['server']
      \ }
      \ ]

autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion across your languages
autocmd FileType c,cpp,python,javascript,html,css,cs,java,markdown setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \ })
