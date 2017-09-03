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
