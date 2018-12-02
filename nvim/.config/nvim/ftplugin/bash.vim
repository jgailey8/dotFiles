" ========= LanguageClient ========= {{{

" let g:LanguageClient_serverCommands = {
"     \ 'sh': ['bash-language-server', 'start']
"     \ }
"
" let g:LanguageClient_diagnosticsEnable = 0
" nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> <leader>F :call LanguageClient_textDocument_formatting()<CR>
" nnoremap <silent> <leader>r :call LanguageClient_textDocument_references()<CR>
" nnoremap <silent> ca :call LanguageClient_textDocument_codeAction()<CR>
" inoremap <C-space>:call LanguageClient_textDocument_completion()<CR>
"
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"
" autocmd FileType sh let g:LanguageClient_diagnosticsEnable = 1
