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

function! funcs#DiffStatus() abort
    if &diff 
        let l:head = FugitiveStatusline()
        " return head
        " let l:buf = expand('%:p')
        " let current_buff = bufnr("%")
        " if current_buff == 1
        "     return 'CURRENT 1'
        " elseif current_buff == 2
        "     return 'LOCAL 4'
        " elseif current_buff == 3
        "     return 'BASE 3'
        " elseif current_buff == 4
        "     return 'REMOTE 4'
        " endif
        if l:head =~# 'Git:3'
            return printf('3 BASE')
        elseif l:head =~# 'Git:2'
            return printf('2 LOCAL')
        endif
        "     return bufnr("%") . 'LOCAL 2'
        " elseif l:buf =~# '\/\/4'
        "     return bufnr("%") . 'BASE 4'
        " elseif l:buf =~# '\/\/4'
        "     return bufnr("%") . 'REMOTE 4'
        " endif
        " let buf1 = matchstr(expand(, '\ca href=\([''"]\)\zs.\{-}\ze\1')
        " return printf('✗ %s diff',  expand('%:p'))
    else
        return ''
    endif
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

" create highlight groups without modifying colorscheme
function! ExtendHighlights()
    highlight HLCurrent ctermfg=241 ctermbg=220 cterm=bold
endfunction
augroup ExtendHighlights
    autocmd!
    autocmd ColorScheme * call ExtendHighlights()
    highlight HLCurrent ctermfg=241 ctermbg=220 cterm=bold
augroup END

" highlight current selected match.
function! funcs#HLNext()
    let target = '\c\%#'.@/
    let match = matchadd('HLCurrent', target)
    redraw
endfunction

" vim:foldmethod=marker:foldlevel=0
