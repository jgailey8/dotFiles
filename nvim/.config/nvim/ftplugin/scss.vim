setlocal tabstop=2 sts=2 sw=2
set list                      " show invisible characters by default,
set listchars=trail:.

let g:lsp_signs_enabled = 0         " enable signs
let g:lsp_diagnostics_echo_cursor = 0 " enable echo under cursor when in normal mode
" set completefunc=csscomplete#CompleteCSS
" set omnifunc=csscomplete#CompleteCSS

call LspKeyMaps()
