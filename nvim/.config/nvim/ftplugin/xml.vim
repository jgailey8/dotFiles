" nnoremap gp :silent %!prettier --stdin --stdin-filepath % <CR>

" command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! Prettier :silent %!prettier --stdin --stdin-filepath % <CR>
