set hidden
" https://github.com/OmniSharp/omnisharp-node-client.git
" npm install && npm run tsc
" extract omnisharp-linux-x64 to /omnisharp-node-client/omnisharp-linux-x64
" https://github.com/OmniSharp/omnisharp-roslyn/releases
"
" https://github.com/sourcegraph/javascript-typescript-langserver
" or npm install -g javascript-typescript-langserver
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'cs': ['node', '~/.local/omnisharp-node-client/languageserver/server.js'],
    \ }

" " Automatically start language servers.
let g:LanguageClient_autoStart = 1
autocmd Filetype cs let g:LanguageClient_autoStart = 0
augroup langServer_commands
    autocmd!
    autocmd FileType javascript nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
    autocmd FileType javascript nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    autocmd FileType javascript nnoremap <silent> <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
    autocmd FileType javascript nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
    autocmd FileType javascript nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
    autocmd FileType javascript nnoremap <silent> <leader>f :call LanguageClient_textDocument_codeAction()<CR>
    autocmd FileType javascript nnoremap <silent> <leader> F :call LanguageClient_textDocument_formatting()<CR>

    autocmd FileType typescript nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
    autocmd FileType typescript nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    autocmd FileType typescript nnoremap <silent> <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
    autocmd FileType typescript nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
    autocmd FileType typescript nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
    autocmd FileType typescript nnoremap <silent> <leader>f :call LanguageClient_textDocument_codeAction()<CR>
    autocmd FileType typescript nnoremap <silent> <leader> F :call LanguageClient_textDocument_formatting()<CR>

    autocmd FileType cs nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
    autocmd FileType cs nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    autocmd FileType cs nnoremap <silent> <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
    autocmd FileType cs nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
    autocmd FileType cs nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
    autocmd FileType cs nnoremap <silent> <leader>f :call LanguageClient_textDocument_codeAction()<CR>
    autocmd FileType cs nnoremap <silent> <leader> F :call LanguageClient_textDocument_formatting()<CR>
augroup END
