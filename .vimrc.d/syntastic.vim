" syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%{fugitive#statusline()}
    set statusline+=%*
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 1
    let g:syntastic_javascript_checkers = ['jshint', 'eslint']
    let g:syntastic_typescript_checkers = ["tslint"]
    " OmniSharper
    let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
    " If you are using the omnisharp-roslyn backend, use the following
    " let g:syntastic_cs_checkers = ['code_checker']
    " disable syntasticCheck as default
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ["javascritpt","typescript", "cs", "html"],'passive_filetypes': [] }
