if executable('javascript-typescript-stdio')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
        \ 'whitelist': ['javascript'],
        \ })

    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
endif

if executable('node')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'omnisharp-language-server',
        \ 'cmd': {server_info->['node', expand('~/.local/omnisharp-node-client/languageserver/server.js')]},
        \ 'whitelist': ['cs'],
        \ })
endif
" if has('python3')
"     let g:UltiSnipsExpandTrigger="<c-e>"
"     call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"         \ 'name': 'ultisnips',
"         \ 'whitelist': ['*'],
"         \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"         \ }))
" endif
" \ 'cmd': {server_info->[&shell, &shellcmdflag, 'node', '~/.local/omnisharp-node-client/languageserver/server.js']},
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1
autocmd FileType javascript setlocal omnifunc=lsp#complete
autocmd FileType typescript setlocal omnifunc=lsp#complete
autocmd FileType cs setlocal omnifunc=lsp#complete


imap <c-space> <Plug>(asyncomplete_force_refresh)
nnoremap <silent> <leader>h :LspHover<CR>
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> <leader>s :LspDocumentSymbol<CR>
nnoremap <silent> <F2> :LspRename<CR>
nnoremap <silent> <leader>r :LspRename<CR>
nnoremap <silent> <leader>f :LspDocumentDiagnostics<CR>
nnoremap <silent> <leader> F :LspDocumentFormat<CR>
