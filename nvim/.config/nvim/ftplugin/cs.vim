" ========= Omnisharp ========= {{{

" start manually
" let g:Omnisharp_start_server = 0
" let g:Omnisharp_stop_server = 0
" let g:OmniSharp_port = 2000
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" let g:omnicomplete_fetch_full_documentation = 1
set completeopt-=preview
set previewheight=2

let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim

setlocal completefunc=OmniSharp#Complete

" autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
nnoremap ca :OmniSharpGetCodeActions<CR>
nnoremap <buffer> <Leader>h :OmniSharpTypeLookup<CR>
nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
nnoremap <F2> :OmniSharpRename<CR>

nnoremap <silent> er <Esc>:call CSShowErrors()<CR>

function! CSShowErrors() abort
    let errors = OmniSharp#CodeCheck()
    call setloclist(0, [], ' ', {'items': errors}) 
    let matches = []
    for err in errors
        call add(matches, '\%' . err.col . 'c' . '\%' . err.lnum . 'l')
    endfor
    execute 'match Error /'. join(matches, '\|') . '/'
endfunction
" vim:foldmethod=marker:foldlevel=100
