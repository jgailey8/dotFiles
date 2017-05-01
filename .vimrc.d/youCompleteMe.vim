let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_key_list_select_completion = [] " unbind tab
autocmd FileType javascript,typescript,html,css,json set omnifunc=syntaxcomplete#Complete
