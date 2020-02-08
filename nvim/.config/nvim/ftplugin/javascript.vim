" runtime! plugins/coc-mappings.vim
runtime! plugins/coc-mappings.vim

" let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#config#print_width = 80
" let g:prettier#partial_format=1
setlocal tabstop=2 sts=2 sw=2

au FileType javascriptreact :UltiSnipsAddFiletypes javascript
" au FileType javascriptreact :UltiSnipsAddFiletypes html

" Change working dir to the src for phoenix_frontend
let gitdir=system('echo $(git rev-parse --show-toplevel)/src')
if (empty(matchstr(gitdir, '^fatal:.*')) && gitdir =~? 'phoenix_frontend' || gitdir =~? 'patient_portal')
    cd `=gitdir`
endif

nnoremap run :! node %<CR>

let g:root_markers = ['package.json', '.git/']
function! s:RunVimTest(cmd)
    " I guess this part could be replaced by projectionist#project_root
    for marker in g:root_markers
        let marker_file = findfile(marker, expand('%:p:h') . ';')
        if strlen(marker_file) > 0
            let g:test#project_root = fnamemodify(marker_file, ":p:h")
            break
        endif
        let marker_dir = finddir(marker, expand('%:p:h') . ';')
        if strlen(marker_dir) > 0
            let g:test#project_root = fnamemodify(marker_dir, ":p:h")
            break
        endif
    endfor

    execute a:cmd
endfunction
nnoremap <leader>tf :call <SID>RunVimTest('TestFile')<cr>
nnoremap <leader>te :call <SID>RunVimTest('TestNearest')<cr>
nnoremap <leader>ts :call <SID>RunVimTest('TestSuite')<cr>
nnoremap <leader>tv :call <SID>RunVimTest('TestVisit')<cr>

let test#strategy = "neovim"
let test#neovim#term_position = "vert"

nnoremap <silent> <leader>r :silent call ChromeDevTools_Page_reload()<cr>
nnoremap <silent> <leader>ex :call EvaluteLine()<cr>

function! EvaluteLine() 
  let l:content = getline('.') 
  call ChromeDevTools_Runtime_evaluate([l:content])
endfunction
