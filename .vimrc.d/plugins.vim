call plug#begin('~/.vim/plugged')
    "---- main plugs -----
        Plug 'tomtom/tcomment_vim'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/nerdTree'
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'tpope/vim-dispatch'
        Plug 'tpope/vim-fugitive'

        " must run ./install.py in directory for installing ycmd server
        " ./install.py --tern-completer --clang-completer --omnisharp-completer
        Plug 'Valloric/YouCompleteMe'
    "------snippets--------
        " Plug 'Shougo/neocomplete'
        Plug 'Shougo/neosnippet'
        Plug 'Shougo/neosnippet-snippets'

        " Snippets are separated from the engine. Add this if you want them:
        Plug 'honza/vim-snippets'
        Plug 'magarcia/vim-angular2-snippets'  " or just cppy snippet into snippets directory
    "----  format code -----
    "   really only use for c# astyle
        " Plug 'Chiel92/vim-autoformat'

        Plug 'google/vim-maktaba'
        Plug 'google/vim-codefmt'
        Plug 'google/vim-glaive'  " :help :Glaive` for usage.
    "---- syntastic -----
        Plug 'scrooloose/syntastic'
    "----- javascritp/Html ----------------
        Plug 'othree/html5.vim'
        Plug 'pangloss/vim-javascript'
        " Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    "---- dotnet / c# ----------------
        Plug 'OmniSharp/omnisharp-vim'
    "---------typescript and angular -------
        Plug 'leafgarland/typescript-vim'
    "----- php -----------------
        " Plug 'beanworks/vim-phpfmt'
    "----- extras ---------
        " Plug 'milkypostman/vim-togglelist'     " toggle location & quickfix window
        Plug 'vim-airline/vim-airline'          " airline status bar
        Plug 'vim-airline/vim-airline-themes'
call plug#end()

call glaive#Install()
