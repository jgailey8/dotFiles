runtime! plugins/coc-mappings.vim

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#print_width = 80
let g:prettier#partial_format=1
setlocal tabstop=2 sts=2 sw=2

augroup JsxAutoCmd
    autocmd!
    autocmd FileType javascript.jsx UltiSnipsAddFiletypes html
augroup END

" Change working dir to the src for phoenix_frontend
let gitdir=system('echo $(git rev-parse --show-toplevel)/src')
if (empty(matchstr(gitdir, '^fatal:.*')) && gitdir =~? 'phoenix_frontend' || gitdir =~? 'patient_portal')
    cd `=gitdir`
endif

nnoremap run :! node %<CR>
