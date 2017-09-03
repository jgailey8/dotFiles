" install vim-plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    "---- main plugs -----
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdTree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-fugitive'
    " Plug 'scrooloose/syntastic'
    Plug 'w0rp/ale'

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

    Plug 'airblade/vim-gitgutter'
    " Plug 'davidhalter/jedi-vim'
call plug#end()
