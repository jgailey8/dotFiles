autocmd filetype python set expandtab

autocmd filetype unix setlocal foldmethod=marker
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype python set list                      " show invisible characters by default,
autocmd Filetype python set listchars=trail:.
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
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
