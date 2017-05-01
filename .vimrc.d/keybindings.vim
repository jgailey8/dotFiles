" hard mode
" map <UP>    <NOP>
" map <DOWN>  <NOP>
" map <LEFT>  <NOP>
" map <RIGHT> <NOP>
" exit from insert mode with  jj
imap jk <Esc>
" remap colon
nmap ; :

" quite/save faster
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
" nmap Q :q!
" nmap W :w

" Force saving files that require root permission
command SudoWrite w !sudo tee "%"

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" new line without going to insert mode
nnoremap O o <esc>

nnoremap <Leader>w :w<CR>
nnoremap <F2> :buffers<CR>:buffer<Space>
set pastetoggle=<F3>            " paste mode
" Toggle Syntastic
map <F4> :SyntasticToggleMode<Cr>
" make F5 compile
map <F5> :make!<cr>
" Toggle highlight
map <F6> :set hlsearch!<CR>

" clear search highlight <leader><leader> 
" nnoremap <esc><esc> :noh<return>
nnoremap <Leader><Leader> :noh<return>

" ====easier navigation=====
" Better window navigation -Ctrl+j,k etc..
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" more natural up down movement
nnoremap j gj
nnoremap k gk

" end and start of line with shift h l
map <S-h> <Home>
map <S-l> <End>

"page up down with shift j/k
map <S-j> <C-d>
map <S-k> <C-u>

" show buffer list with Control b
nnoremap <C-b> :buffers<CR>:buffer<Space>  

" show nerdtree with Control n
map <C-n> :NERDTreeToggle<CR>
" Move up and down in autocomplete with Control j/k
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc><Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
" Enable folding with the spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" FOLD ALL
nnoremap zA zM
" UNFOLD ALL
nnoremap Za zR

" search and replace hotkey
nnoremap <Leader>sr :%s/wordToReplace/replaceWith/gc

" neosnippet
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" goToDefinition, referenceses etc...
augroup filetype_javascript, filetype_typescript
    autocmd!
    autocmd FileType javascript,typescript nnoremap gd :YcmCompleter GoToDefinition<CR>
    autocmd FileType javascript,typescript nnoremap gr :YcmCompleter GoToReferences<CR>
    autocmd FileType javascript,typescript nnoremap gt :YcmCompleter GetType<CR>
    autocmd FileType javascript,typescript nnoremap rn :YcmCompleter RefactorRename

    autocmd FileType javascript,typescript nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
    autocmd FileType javascript,typescript nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
    autocmd FileType javascript,typescript nnoremap <leader>gt :YcmCompleter GetType<CR>
    autocmd FileType javascript,typescript nnoremap <leader>rn :YcmCompleter RefactorRename
augroup END

augroup filetype_cs
    autocmd!
    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>gr :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>gt :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>gs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>gu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

    autocmd FileType cs nmap rn :OmniSharpRename<cr>
augroup END
