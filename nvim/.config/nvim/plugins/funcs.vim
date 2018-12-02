scriptencoding utf-8

" - Close other windows {{{
function! funcs#CloseOtherWindows()
	pclose
	lclose
	cclose
	helpclose
	if exists('g:NERDTree') && g:NERDTree.IsOpen()
		NERDTreeToggle
	endif
endfun "}}}

" - Lightline Status Functions {{{

function! funcs#readonly() abort
    return &readonly ? 'RO' : ''
endfun
function! funcs#AleStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
\        '◆ %d ✗ %d',
\        l:all_non_errors,
\        l:all_errors
\    )
endfunction

function! funcs#LinterStatus() abort
    let l:active = get(g:, 'ale_enabled', 0) == 1
                \ && getbufvar(bufnr(''), 'ale_linted', 0) > 0
    if(l:active == 0)
        return ''
    else
        " let l:checking = ale#engine#IsCheckingBuffer(bufnr('')) == 1
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:status = l:counts.total == 0 ? '✔' : '!'
        return l:status
        " return l:checking ? printf('%3s','...') : l:status
    endif
endfunction

function! funcs#LinterErrors() abort
    let l:active = get(g:, 'ale_enabled', 0) == 1
\           && getbufvar(bufnr(''), 'ale_linted', 0) > 0
    if(l:active == 0)
        return ''
    else
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:errors = l:counts.error + l:counts.style_error
        " let l:warnings = l:counts.total - l:errors
        return printf('✗ %d', l:errors)
    endif
endfunction

function! funcs#LinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:errors = l:counts.error + l:counts.style_error
    let l:warnings = l:counts.total - l:errors
    let l:active = get(g:, 'ale_enabled', 0) == 1
\           && getbufvar(bufnr(''), 'ale_linted', 0) > 0
    return l:active ? printf('◆ %d', l:warnings) : ''
endfunction

" show modified symbol in filename
function! funcs#FilenameModified()
  let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let l:modified = &modified ? '*' : ''
  return l:filename . l:modified
endfunction " }}}

" - fold text dispaly header {{{
function! funcs#FoldText()
    let l:lpadding = &foldcolumn
    redir => l:signs
        execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~# 'id=' ? 2 : 0

    if exists('+relativenumber')
        if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        elseif (&relativenumber)
        let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
        endif
    else
        if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, '.', 'x', 'g'))) . l:info
endfunction " }}}

" - Google Search {{{
function! funcs#GoogleSearch()
     let l:searchterm = getreg('g')
     silent! exec "silent! !xdg-open \"http://google.com/search?q=" . l:searchterm . "\" &"
endfunction
"}}}

" - Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
" }}}

function! g:LanguageClientKeyMaps()
    augroup LanguageClientBindings
        autocmd!
        nnoremap <F5> :call LanguageClient_contextMenu()<CR>
        nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
        nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
        nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
        nnoremap <silent> <leader>F :call LanguageClient_textDocument_formatting()<CR>
        nnoremap <silent> <leader>r :call LanguageClient_textDocument_references()<CR>
        nnoremap <silent> <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
        nnoremap <silent> ca :call LanguageClient_textDocument_codeAction()<CR>
        inoremap <C-space>:call LanguageClient_textDocument_completion()<CR>
    augroup END
endfunction

function! g:LspKeyMaps()
    augroup LspBindings
    imap <c-space> <Plug>(asyncomplete_force_refresh)
    nnoremap <silent> <leader>h :LspHover<CR>
    nnoremap <silent> gd :LspDefinition<CR>
    nnoremap <silent> ca :LspCodeAction<CR>
    nnoremap <silent> <leader>s :LspDocumentSymbol<CR>
    nnoremap <silent> <F2> :LspRename<CR>
    nnoremap <silent> <leader>er :LspDocumentDiagnostics<CR>
    nnoremap <silent> <leader> F :LspDocumentFormat<CR>
    augroup END
endfunction

" vim:foldmethod=marker:foldlevel=0
