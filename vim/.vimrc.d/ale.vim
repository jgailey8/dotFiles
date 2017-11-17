" clear highlight color
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" warning and error sign
let g:ale_sign_error = 'xx'
let g:ale_sign_warning = '--'
" check errors only on save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0

" show error msg in status bar
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linters = {
\           'jsx': ['stylelint', 'eslint'], 
\           'javascript': ['eslint'],
\           'cs': [],
\           'json': ['jsonlint'],
\           'typescript': ['tslint']}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 0

" jsx support
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
let g:ale_linter_aliases = {'jsx': 'css'}

" show erors/warnings in status line
let g:airline#extensions#ale#enabled = 1

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
