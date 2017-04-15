call plug#begin('~/.vim/plugged')
    "---- main plugs -----
        Plug 'tomtom/tcomment_vim'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/nerdTree'
        Plug 'ctrlpvim/ctrlp.vim'
        " Plug 'tpope/vim-dispatch'
        Plug 'tpope/vim-fugitive'
        " Plug 'janko-m/vim-test'
        " Plug 'tpope/vim-haml'
        " Plug 'skywind3000/asyncrun.vim'
        " must run ./install.py in directory for installing ycmd server
        " ./install.py --tern-completer --clang-completer
        Plug 'Valloric/YouCompleteMe'
    "------snippets--------
        Plug 'Shougo/neocomplete'
        Plug 'Shougo/neosnippet'
        Plug 'Shougo/neosnippet-snippets'
        " Plug 'tomtom/tlib_vim'
        " Plug 'MarcWeber/vim-addon-mw-utils'
        " Plug 'garbas/vim-snipmate'
        " Plug 'honza/vim-snippets'

        " Snippets are separated from the engine. Add this if you want them:
        Plug 'honza/vim-snippets'
        Plug 'magarcia/vim-angular2-snippets'  " or just cppy snippet into snippets directory
    "----  format code -----
        " Plug 'Chiel92/vim-autoformat'
        "  requires clang and js-buetify
        Plug 'google/vim-maktaba'
        Plug 'google/vim-codefmt'
        Plug 'google/vim-glaive'  " :help :Glaive` for usage.
    "---- syntastic -----
        Plug 'scrooloose/syntastic'
    "----- javascritp/Html ----------------
        Plug 'othree/html5.vim'
        Plug 'pangloss/vim-javascript'
        " Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
    "---- dotnet / c# ----------------
        Plug 'OmniSharp/omnisharp-vim'
    "---------typescript and angular -------
        Plug 'leafgarland/typescript-vim'
        " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
        " Plug 'Quramy/tsuquyomi'
    "----- php -----------------
        " Plug 'beanworks/vim-phpfmt'
    "----- extras ---------
        " Plug 'milkypostman/vim-togglelist'     " toggle location & quickfix window
        " Plug 'tpope/vim-capslock'
        " Plug 'jiangmiao/auto-pairs'
        Plug 'vim-airline/vim-airline'          " airline status bar
        Plug 'vim-airline/vim-airline-themes'
        "  Plug 'crusoexia/vim-monokai'
call plug#end()

call glaive#Install()

