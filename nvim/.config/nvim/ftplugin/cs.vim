" ========= Omnisharp ========= {{{

" start manually
let g:Omnisharp_start_server = 0
let g:Omnisharp_stop_server = 0
let g:OmniSharp_port = 2000
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" let g:omnicomplete_fetch_full_documentation = 1
set completeopt-=preview
set previewheight=2

let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim

setlocal omnifunc=OmniSharp#Complete

" autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
nnoremap ca :OmniSharpGetCodeActions<CR>
nnoremap <buffer> <Leader>h :OmniSharpTypeLookup<CR>

nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
nnoremap <F2> :OmniSharpRename<CR>

"}}}

" vim:foldmethod=marker:foldlevel=100
