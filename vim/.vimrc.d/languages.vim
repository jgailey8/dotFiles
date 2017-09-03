" -----------------------------------------
"  ============ Javascript/TernJs ================
"  ----------------------------------------
autocmd FileType javascript setlocal completeopt+=menu,preview
let g:tern_map_keys=0
" let g:tern_show_argument_hints='on_hold'
" let g:tern_show_signature_in_pum=1
let g:tern_show_loc_after_rename=1
let g:jsx_ext_required = 1 " Allow JSX in normal JS files

autocmd FileType javascript nmap <leader>gd :TernDef<CR>
autocmd FileType javascript nmap <Leader>rn :TernRename<CR>
autocmd FileType javascript nmap <leader>fr :TernRefs<CR>
autocmd FileType javascript nmap <Leader>ft :TernType<CR>
" find refernces

" -----------------------------------------
"  ============ Typescript/Tsuquyomi ================
"  ----------------------------------------
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript let NERDTreeIgnore = ['\.js$']
let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc

let g:tsuquyomi_disable_quickfix = 0

autocmd FileType typescript nmap <leader>gd :TsuDefinition<CR>
autocmd FileType typescript nmap <Leader>rn <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <Leader>h : <C-u>echo tsuquyomi#hint()<CR>
" find refernces
autocmd FileType typescript nmap <leader>fr :TsuReferences<CR>
autocmd FileType typescript nmap <leader>ti :TsuImport<CR>
" go back
autocmd FileType typescript nmap <leader>gb :TsuGoBack<CR> 

autocmd FileType typescript nmap <leader>f :TsuQuickFix<CR> 

autocmd FileType typescript nmap <leader>ss :TsuStartServer 

autocmd FileType typescript nmap <leader>sS :TsuStopServer 
" show errors
autocmd FileType typescript nmap <leader>er : TsuGeterrProject<CR>

" show tooltip
" set ballooneval
" autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
autocmd FileType typescript nmap <buffer> <Leader>h : echo tsuquyomi#hint()<CR>

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" -----------------------------------------
"  ===============  C#/Omnisharp  ===================
"  ----------------------------------------
"
"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
" autocmd FileType cs set completeopt=longest,menuone,preview
autocmd FileType cs setlocal completeopt+=menu,preview

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
autocmd FileType cs set splitbelow

" automatic syntax check on events (TextChanged requires Vim 7.4)
" autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

" Automatically add new cs files to the nearest project on save
autocmd BufWritePost *.cs call OmniSharp#AddToProject()

augroup filetype_cs
    autocmd!
    command! FormatDocumnet :OmniSharpCodeFormat
    autocmd FileType cs nnoremap <leader>b <cr>:Start dotnet run<cr>
    " Contextual code actions (requires CtrlP or unite.vim)
    nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
    vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
    nnoremap <leader>th :OmniSharpHighlightTypes<cr>
    " Run code actions with text selected in visual mode to extract method
    vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

    autocmd filetype cs nmap <leader>rn :OmniSharpRename<cr>
    autocmd FileType cs nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>gr :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>gt :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>

    autocmd FileType cs nnoremap <leader>Ft :call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fr :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>t :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <leader>N :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <leader>n :OmniSharpNavigateDown<cr>

    " Force OmniSharp to reload the solution. Useful when switching branches etc.
    nnoremap <leader>rl :OmniSharpReloadSolution<cr>
    " Load the current .cs file to the nearest project
    nnoremap <leader>ap :OmniSharpAddToProject<cr>

    " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
    nnoremap <leader>ss :OmniSharpStartServer<cr>
    nnoremap <leader>sp :OmniSharpStopServer<cr>
augroup END

