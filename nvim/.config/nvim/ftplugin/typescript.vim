" ========= LanguageClient ========= {{{
" let g:LanguageClient_serverCommands = {
"     \           'typescript': ['typescript-language-server', '--stdio'],
"     \ }
"
" let g:LanguageClient_rootMarkers = ['tsconfig.json']
"
" let g:LanguageClient_diagnosticsEnable = 0
"
" nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> <leader>F :call LanguageClient_textDocument_formatting()<CR>
" nnoremap <silent> <leader>r :call LanguageClient_textDocument_references()<CR>
" nnoremap <silent> ca :call LanguageClient_textDocument_codeAction()<CR>
" inoremap <C-space>:call LanguageClient_textDocument_completion()<CR>
"
" noremap <leader>cm :call LanguageClient_contextMenu()<CR>
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" autocmd FileType cs let g:LanguageClient_diagnosticsEnable = 1

" let g:LanguageClient_changeThrottle = 0.5
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
" let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

setlocal tabstop=2 sts=2 sw=2
