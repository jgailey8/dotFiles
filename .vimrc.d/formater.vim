
augroup autoformat_settings
    autocmd filetype python set expandtab
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype python set list                      " show invisible characters by default,
    autocmd Filetype python set listchars=trail:.
    " codefmt 
    " autocmd FileType bzl AutoFormatBuffer buildifier
    " autocmd FileType c,cpp,proto,typescript AutoFormatBuffer clang-format
    " autocmd FileType dart AutoFormatBuffer dartfmt
    " autocmd FileType go AutoFormatBuffer gofmt
    " autocmd FileType gn AutoFormatBuffer gn
    " autocmd FileType html,css,json,javascript  AutoFormatBuffer js-beautify
    " autocmd FileType java AutoFormatBuffer google-java-format
    " autocmd FileType python AutoFormatBuffer yapf
augroup END

" :command FormatDocument Autoformat

" let g:formatters_javascript = ['js-beautify']
" let g:formatterpath = ['/home/jared']
" let g:formatters_javascript = ['clang-format']
" let g:formatdef_eslint = '~/.formatdef_eslint';
" let g:autoformat_verbosemode=1
" let verbose=1
