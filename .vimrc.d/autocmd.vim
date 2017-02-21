augroup autoformat_settings
    autocmd filetype python set expandtab
    augroup jsFolds
        autocmd!
        autocmd FileType javascript,typescript,json syntax region braceFold start="{" end="}" transparent fold
        " autocmd FileType javascript,typescript,json syntax region bracketFold start="[" end="]" transparent fold
        " autocmd FileType javascript,typescript,json syntax sync fromstart
        " autocmd FileType javascript,typescript,json set foldmethod=syntax
        autocmd Filetype javascript let javaScript_fold=1
    augroup end
    " autocmd filetype unix setlocal foldmethod=marker
    "autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype python set list                      " show invisible characters by default,
    autocmd Filetype python set listchars=trail:.
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

    autocmd FileType html,css,json AutoFormatBuffer js-beautify
    " autocmd FileType html,css,scss,json AutoFormatBuffer js-beautify

augroup END
" go defintion
" autocmd FileType typescript nmap gd :TsuDefinition<CR>
" autocmd FileType javascript nmap gd :TernDef <CR>
" " find refernces
" autocmd FileType typescript nmap fr :TsuReferences<CR>
" autocmd FileType javascript nmap fr :TernRefs <CR>
" " import
" autocmd FileType typescript nmap ti :TsuImport<CR>
" " go back
" autocmd FileType typescript nmap tb :TsuGoBack<CR> 
" " show errors
" autocmd FileType typescript nmap Se : TsuGeterrProject<CR>
augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType html,css,json AutoFormatBuffer js-beautify
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
    " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
