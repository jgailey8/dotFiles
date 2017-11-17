let g:asyncomplete_remove_duplicates = 1

        " \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'TodoDotnet.Api.sln'))},
        " \ 'cmd': {server_info->[&shell, &shellcmdflag, '/home/jared/Downloads/roslyn/run --lsp -s /home/jared/TodoDotnet/TodoDotnet.sln']},
        " \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'TodoDotnet.Api.sln'))},
" imap <c-space> <Plug>(asyncomplete_force_refresh)

set completeopt+=preview

au User asyncomplete_setup call asyncomplete#register_source({
            \ 'name': 'lsp',
            \ 'whitelist': ['javascript'. 'typescript', 'cs'],
            \ 'priority': 1,
            \ 'completor': function('asyncomplete#sources#lsp#completor'),
            \ })

" ----------------
" ---- LSP -------
" ----------------
" let g:lsp_async_completion = 1

" autocmd FileType typescript setlocal omnifunc=lsp#complete
" autocmd FileType javascript setlocal omnifunc=lsp#complete
autocmd FileType cs setlocal omnifunc=lsp#complete
" autocmd FileType typescript setlocal completeopt+=menu,preview

if executable('node')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'omnisharp',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'node /home/jared/Downloads/omnisharp-node-client/languageserver/server.js']},
        \ 'whitelist': ['cs'],
        \ })
endif
                " \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
if executable('javascript-typescript-langserver')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'typescript-langserver',
                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
                \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
                \ 'whitelist': ['typescript'],
                \ })
endif

if executable('javascript-typescript-langserver')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'javascript-langserver',
                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio --trace --logfile ~/blah']},
                \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
                \ 'whitelist': ['javascript'],
                \ })
endif

" au User lsp_setup call lsp#register_server({
"             \ 'name': 'omnisharp',
"             \ 'cmd': {server_info->[&shell, &shellcmdflag, '~/Downloads/stdio/run', '--lsp', '--source ~/TodoDotnet/TodoDotnet.sln']},
"             \ 'whitelist': ['cs'],
"             \ })

" autocmd FileType typescript,javascript,cs  nmap <leader>gd :LspDefinition<CR>
" autocmd FileType typescript,javascript,cs nmap <Leader>rn :LspRename<CR>
" autocmd FileType typescript,javascript,cs nmap <Leader>h   :LspHover<CR>
" autocmd FileType typescript,javascript,cs nmap <Leader>fr   :LspReferences<CR>
" autocmd FileType typescript,javascript,cs nmap <Leader>ld   :LspDocumentFormat<CR>

" " let g:lsp_log_verbose = 1
" " let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
