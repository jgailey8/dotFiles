call plug#begin('~/.vim/plugged')
    "---- main plugs -----
        Plug 'tomtom/tcomment_vim'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/nerdTree'
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'tpope/vim-dispatch'
        Plug 'tpope/vim-fugitive'
        Plug 'scrooloose/syntastic'

        " must run ./install.py in directory for installing ycmd server
        " ./install.py --tern-completer --clang-completer --omnisharp-completer
        " Plug 'Valloric/YouCompleteMe',{ 'do': './install.py --tern-completer --omnisharp-completer' }
        Plug 'Shougo/neocomplete'
    "------snippets--------
        Plug 'Shougo/neosnippet'
        " Plug 'Shougo/neosnippet-snippets'

        " Snippets are separated from the engine. Add this if you want them:
        Plug 'honza/vim-snippets'
        " Plug 'magarcia/vim-angular2-snippets'  " or just cppy snippet into snippets directory
    "----  format code -----
        Plug 'Chiel92/vim-autoformat'
        " Plug 'google/vim-maktaba'
        " Plug 'google/vim-codefmt'
        " Plug 'google/vim-glaive'  " :help :Glaive` for usage.
    "---- syntastic -----
    "----- javascritp----------------
        " Plug 'othree/html5.vim'
        Plug 'pangloss/vim-javascript'
        Plug 'mxw/vim-jsx'
        " Plug 'mxw/vim-jsx' " react/jsx
        Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    "----- typescript -------
        Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
        Plug 'leafgarland/typescript-vim'
    
    "---- dotnet / c# ----------------
        Plug 'OmniSharp/omnisharp-vim'
    "---------typescript and angular -------
    "----- php -----------------
        " Plug 'beanworks/vim-phpfmt'
    "----- extras ---------
        Plug 'vim-airline/vim-airline'          " airline status bar
        Plug 'vim-airline/vim-airline-themes'
call plug#end()

" call glaive#Install()
