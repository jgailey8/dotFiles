" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '-'
let g:syntastic_style_error_symbol = 'x'
let g:syntastic_style_warning_symbol = '-'
" let g:syntastic_enable_balloons = 1
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_auto_jump = 0
" let g:syntastic_enable_signs = 1

highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap

" Checkers
    let g:syntastic_javascript_checkers = ['eslint']
    " let g:syntastic_html_checkers = ['jshint']
    let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
    " If you are using the omnisharp-roslyn backend, use the following
    let g:syntastic_cs_checkers = ['code_checker']
    " prefer local project tslint (dont know if this works)
    let s:tslint_path = system('PATH=$(npm bin):$PATH && which tslint')
    let b:syntastic_typescript_tslint_exec = substitute(s:tslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
    " let g:syntastic_javascript_eslint_exe="$(npm bin -g)/eslint"

" disable syntasticCheck as default
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ["javascript", "typescript", "cs", "html", "python", "sh"],'passive_filetypes': [] }

" debug syntastic
" let g:syntastic_debug=3
