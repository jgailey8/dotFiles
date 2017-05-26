" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets

" let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/UltiSnips/'
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets/'

let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }
" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Plugin key-mappings.
imap <expr><TAB>
            \ pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ?
            \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" smart C-k
" if in omni menu <C-p>
" else expand snippet
imap <expr><C-K> pumvisible() ? "\<C-p>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"


" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
