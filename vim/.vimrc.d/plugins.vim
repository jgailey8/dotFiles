call plug#begin('~/.vim/plugged')
    "---- main plugs -----
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdTree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/syntastic'

    Plug 'Shougo/neocomplete'

    "------snippets--------
    Plug 'Shougo/neosnippet'
    " Plug 'Shougo/neosnippet-snippets'
    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'

    "----  format code -----
    Plug 'Chiel92/vim-autoformat'

    "----- javascritp----------------
    " Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

    "----- typescript -------
    Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
    Plug 'leafgarland/typescript-vim'
    " Plug 'magarcia/vim-angular2-snippets'  " or just cppy snippet into snippets directory
    "---- dotnet / c# ----------------
    Plug 'OmniSharp/omnisharp-vim'

    "----- php -----------------
    " Plug 'beanworks/vim-phpfmt'
    "
    "----- extras ---------
    Plug 'vim-airline/vim-airline'          " airline status bar
    Plug 'vim-airline/vim-airline-themes'

    " Plug 'davidhalter/jedi-vim'
call plug#end()
