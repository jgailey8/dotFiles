

augroup autoformat_settings
    command! FormatDocument Autoformat
    autocmd filetype python set expandtab
    " autocmd Filetype html setlocal ts=2 sts=2 sw=2

    autocmd Filetype typescript,html,javascript setlocal ts=2 sts=2 sw=2
    autocmd Filetype python set list                      " show invisible characters by default,
    autocmd Filetype python set listchars=trail:.

    " let g:formatdef_clangformat = "'clang-format --style=file '.bufname('%')"

    " let g:formatdef_clangformat = "'clang-format --style=file '.bufname('%')"
    " let g:formatdef_my_custom_typescript = "'clang-format --style=file '.bufname('%')"
    "
    " let g:formatdef_my_custom_typescript = '"clang-format --style=cs --style=ansi "'
    " let g:formatters_cs = ['clangformat']
    " let g:formatdef_eslint_local = "'$(npm bin)/eslint --fix '.bufname('%')"
    " let g:formatdef_eslint_local = "'$HOME/.node_modules/bin/eslint --fix '.bufname('%')"
    " let g:formatdef_eslint = '"eslint-formatter"'
    " let g:formatters_javascript = ['eslint_local']
    " let g:formatters_javascript = ['eslint_local']
    " let g:formatdef_eslint_global = "eslint"
    " let g:formatdef_eslint = '"eslint-formatter"'
    let g:formatters_javascript = ['eslint_global']
    let g:formatters_typescript = ['clangformat']
    " let g:formatters_javascript = ['jsbeautify_javascript']
    " let g:formatters_javascript = ['jsbeautify_javascript']

    let g:autoformat_verbosemode=1
    " OR:
    " let verbose=1

    " codefmt plugin settings
    " autocmd FileType bzl AutoFormatBuffer buildifier
    " autocmd FileType c,cpp,proto,typescript AutoFormatBuffer clang-format
    " autocmd FileType dart AutoFormatBuffer dartfmt
    " autocmd FileType go AutoFormatBuffer gofmt
    " autocmd FileType gn AutoFormatBuffer gn
    " autocmd FileType html,css,json,javascript  AutoFormatBuffer js-beautify
    " autocmd FileType java AutoFormatBuffer google-java-format
    " autocmd FileType python AutoFormatBuffer yapf
augroup END

autocmd Filetype cs command! FormatDocumentOmni OmniSharpCodeFormat

" npm install -g js-beautify
" let g:formatters_javascript = ['js-beautify']
" let g:formatterpath = ['/home/jared/.node_modules/bin', '/usr/bin']
" let g:formatters_html = ['js-beautify']
