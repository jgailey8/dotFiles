" install vim-plug if it is not installed
" if empty(glob('~/.vim/autoload/plug.vim'))
"     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')
    "---- main plugs -----
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdTree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'w0rp/ale'

    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/asyncomplete.vim'

    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete-buffer.vim'
    " Plug 'yami-beta/asyncomplete-omni.vim'
    " Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
    " Plug 'Shougo/neocomplete'

    "------snippets--------
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    " Snippets are separated from the engine. Add this if you want them:
    " Plug 'honza/vim-snippets'

    "----  format code -----
    Plug 'Chiel92/vim-autoformat'

    "----- javascritp----------------
    " Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    "----- typescript -------
    Plug 'leafgarland/typescript-vim'
    " Plug 'magarcia/vim-angular2-snippets'  " or just cppy snippet into snippets directory
    "---- dotnet / c# ----------------
    Plug 'tpope/vim-dispatch'
    Plug 'OmniSharp/omnisharp-vim'


    "----- extras ---------
    Plug 'vim-airline/vim-airline'          " airline status bar
    Plug 'vim-airline/vim-airline-themes'

    Plug 'airblade/vim-gitgutter'
call plug#end()
