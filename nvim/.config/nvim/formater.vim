augroup autoformat_settings
    command! FormatDocument Autoformat
    autocmd Filetype typescript,html,javascript setlocal ts=2 sts=2 sw=2

    autocmd Filetype python setlocal ts=8 sts=4 sw=4 expandtab
    autocmd Filetype python set list                      " show invisible characters by default,
    autocmd Filetype python set listchars=trail:.

    let g:formatters_typescript = ['clangformat', 'tsfmt']
    " g:formatters_javascript ['eslint_local', 'jsbeautify_javascript', 'jscs', 'standard_javascript', 'xo_javascript']
    " let g:formatters_javascript = ['eslint_local',]
    " let g:formatterpath = ['/some/path/to/a/folder', '/home/superman/formatters']
    let g:formatterpath = ['~/.local/node_modules/bin']
    " let g:formatdef_prettier_js = '"prettier"'
    " let g:formatdef_prettiereslint_js = '"prettier-eslint"'
    " let g:formatters_js = ['prettier_js']

    " let g:formatters_javascript = ['eslint_local', 'prettiereslint_js', 'prettier_js' ]
    " debug autoformat
    let g:autoformat_verbosemode=1

" autocmd FileType javascript set formatprg=prettier-eslint\ --stdin
augroup END
