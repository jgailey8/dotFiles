if has("gui_running")
    set guifont=Inconsolata\ for\ Powerline
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    " no annoying dialogs on close
    set guioptions+=lrbmTLce
    set guioptions-=lrbmTLce
    set guioptions+=c

endif
