" ========= LanguageClient =========
nnoremap run :! node %<CR>

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#print_width = 80
let g:prettier#partial_format=1
setlocal tabstop=2 sts=2 sw=2

augroup JsxAutoCmd
    autocmd!
    autocmd Filetype javascript* set omnifunc=lsp#complete
    autocmd FileType javascript.jsx UltiSnipsAddFiletypes html
augroup END

call LspKeyMaps()
