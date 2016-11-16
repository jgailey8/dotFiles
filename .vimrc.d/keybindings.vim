imap jj <Esc>

set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
" insert mode with new line
nmap <S-i> <esc>o
" remap colon
nmap ; :

" clear search highlight with esc
nnoremap <esc><esc> :noh<return>
" quite/save faster
nmap Q :q!
nmap W :w
" Better window navigation -Ctrl+j,k etc..
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" my easy navigaation
"page up down with shift j/k
map <S-j> <C-d>
map <S-k> <C-u>
map <S-h> <Home>
map <S-l> <End>

"Map to display the list of buffers
nnoremap <F2> :buffers<CR>:buffer<Space>
nnoremap <C-b> :buffers<CR>:buffer<Space>

" Toggle Syntastic
map <F4> :SyntasticToggleMode<Cr>
" make F5 compile
map <F5> :make!<cr>
" Toggle highlight
map <F6> :set hlsearch!<CR>

" inoremap <C-Shift> <C-P>
" hard mode
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

map Fc :FormatCode<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" show nerdtree
 map <C-n> :NERDTreeToggle<CR>
" show quickfix
" show locationList
" nmap <script> Sl :call ToggleLocationList()<CR>
"" Enable folding with the spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" FOLD ALL
nnoremap zA zM
" UNFOLD ALL
nnoremap Za zR
" neosnippet trigger with ctrl-k
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" goToDefinition, referenceses etc...

 nmap gd :YcmCompleter GoToDefinition<CR>
 nmap gr :YcmCompleter GoToReferences<CR>
 nmap gt :YcmCompleter GetType<CR>
 nmap gd :YcmCompleter GetDoc<CR>
 " change all references
 nmap car :YcmCompleter RefactorRename

 " Force saving files that require root permission 
ca w!! w !sudo tee "%"
