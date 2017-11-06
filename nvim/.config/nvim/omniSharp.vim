let g:Omnisharp_start_server  = 0  " dont autostart server
let g:Omnisharp_stop_server  = 0 " dont ask to stop server
let g:OmniSharp_host="http://localhost:2000"
"let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim


" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'
" let g:neocomplete#force_omni_input_patterns.cs = '[^. \t]\.\%(\h\w*\)\?'

" autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
" let g:syntastic_cs_checkers = ['code_checker']
" autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

" Automatically add new cs files to the nearest project on save
" autocmd BufWritePost *.cs call OmniSharp#AddToProject()

"show type information automatically when the cursor stops moving
" autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
" autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

set completeopt-=preview

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    autocmd FileType cs let g:deoplete#sources = ['omni', 'file', 'ultisnips']
    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    " autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>rn :OmniSharpRename<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fi  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFixUsings

    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    " autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>h :OmniSharpGetCodeActions<cr>
    " autocmd FileType cs nnoremap <leader>h :call OmniSharp#GetCodeActions('visual')
    " autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>t :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

    " Contextual code actions (requires CtrlP or unite.vim)
    autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

function! StartOmnisharpServer()
    if !OmniSharp#ServerIsRunning()
        let srv_id = jobstart('~/.local/omnisharp-http/run -s $PWD')
    endif
endfunction
