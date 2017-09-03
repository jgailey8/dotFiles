augroup autoformat_settings
    command! FormatDocument Autoformat
    " autocmd Filetype typescript,html,javascript setlocal ts=2 sts=2 sw=2

    autocmd Filetype python setlocal ts=8 sts=4 sw=4 expandtab
    autocmd Filetype python set list                      " show invisible characters by default,
    autocmd Filetype python set listchars=trail:.

    let g:formatters_typescript = ['clangformat', 'tsfmt']
    " let g:formatters_javascript = ['eslint_local', 'eslint_global', 'js-beautify']
    let g:formatterpath = ['~/.local/node_modules/bin', '/usr/bin']

    " debug autoformat
    let g:autoformat_verbosemode=1
augroup END

autocmd Filetype cs command! FormatDocumentOmni OmniSharpCodeFormat
