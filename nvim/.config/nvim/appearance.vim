set background=dark
if  &t_Co < 255
    colorscheme default
else
    colorscheme monokai
    set cursorline
    " highlight only line number not line
    hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
    " visual mode select bg color
    " hi Visual ctermbg=DarkGrey ctermfg=NONE
    " comment color
    " hi Comment ctermfg=Grey
    " transparent background
    " hi Normal ctermbg=NONE guibg=NONE
    " hi NonText ctermbg=NONE guibg=NONE
    " Overide omnicomplete appearance
    " hi Pmenu  ctermfg=grey ctermbg=black guifg=grey guibg=black
    hi MatchParen cterm=bold,underline ctermbg=none ctermfg=darkgreen guibg=NONE guifg=green

    hi Error ctermfg=Red guifg=Red
    hi Error ctermbg=NONE guibg=NONE
endif


if has("gui_running")
    set guifont=Inconsolata\ 14
    set guioptions+=m  "show menu bar
    set guioptions-=T  "remove toolbar
    " set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    " no annoying dialogs on close
    " set guioptions+=lrbmTLce
    set guioptions-=lrbmTLce
    set guioptions+=c
endif
