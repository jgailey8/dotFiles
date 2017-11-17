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

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>f :call LanguageClient_textDocument_codeAction()<CR>
nnoremap <silent> <leader> F :call LanguageClient_textDocument_formatting()<CR>
