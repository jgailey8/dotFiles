scriptencoding utf-8

inoremap <silent><expr> <c-space> coc#refresh()

nmap gd <Plug>(coc-definition)
nmap <leader>td <Plug>(coc-type-definition)
nnoremap <silent> <leader>er  :<C-u>CocList diagnostics<cr>
nnoremap <leader>h :call <SID>show_documentation()<CR>
nmap <leader>he <Plug>(coc-action-showSignatureHelp)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>pr <Plug>(coc-format)

nmap <F2> <Plug>(coc-rename)
nnoremap coc <Esc>:CocList<CR>
" open up quick fix winow(not sure which mapping i will use yet)
nnoremap er :ll<CR>
nnoremap <leader>er <Esc>:CocList diagnostics<CR>
nmap <leader>ca <Plug>(coc-codeaction)
nmap ca <Plug>(coc-codeaction)
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>


function! s:show_documentation()
if &filetype ==? 'vim'
    execute 'h '.expand('<cword>')
else
    call CocActionAsync('doHover')
endif
endfunction

" Use `:Format` for format current buffer
vmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
