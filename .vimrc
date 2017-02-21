
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing arcnux.vim since it alters the value of the
" 'compatible' option.
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

set mouse=a
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set nocompatible               " be iMproved

set guifont=Inconsolata\ for\ Powerline:h12

" Enable filetype plugins
    filetype plugin on
    filetype indent on
    syntax on
    syntax enable
" editing ng behaviour {{{
    set hidden                      " hide buffers instaed of closing
    set showmode                    " always show what mode we're currently editing in
    set matchtime=0                 " disables moving cursor when matching brackets
    set cursorline                  " highlight current line
    set nowrap                      " don't wrap lines
    set tabstop=4                   " a tab is four space\adafd s
    set softtabstop=4               " when hitting &lt;BS&gt;,i pretend like a tab is removed, even if spaces
    set expandtab                   " expand tabs by default (overloaduable per file type later)
    set shiftwidth=4                " number of spaces to use for autoindenting
    set shiftround                  " use multiple of shiftwidth when indenting with '&lt;' and '&gt;'
    set backspace=indent,eol,start  " allow backspacing over everything in insert mode
    set autoindent                  " always set autoindenting on
    set copyindent                  " copy the previous indentation on autoindenting
    set number                      " always show line numbers
    set showmatch                   " set show matching parenthesis
    set ignorecase                  " ignore case when searching
    set smartcase                   " ignore case if search pattern is all lowercase,
    set smarttab                    " insert tabs on the start of a line according to
    set smartindent
    set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
    " set virtualedit=all             " allow the cursor to go in to "invalid" places
    set hlsearch                    " highlight search terms
    set incsearch                   " show search matches as you type
    set gdefault                    " search/replace globally (on a line) by default
    set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
    set shortmess+=I                " hide the launch screen
    set clipboard=unnamedplus
    set autoread                    " automatically reload files changed outside of Vim"
    set nolist                      " don't show invisible characters by default,
                                    " but it is enabled for some file types (see later)
    set fileformats="unix,dos,mac"
    set timeoutlen=1000 ttimeoutlen=0 "  fixes issue with delay in status change
    set laststatus=2        " always show status bar
    set t_Co=256            " 256 colors
    set viminfo="NONE" " no annoying bkp files and .viminfo
    set nobackup
    set noswapfile
    set completeopt=longest,menuone " omnicomplete dont auto select

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99
" set list
" POWERLINE Status bar
    " set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim/
    " let g:Powerline_symbols = 'fancy'

" AIRLINE Status bar
    let g:airline#extensions#tabline#enabled =1
    " let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
    let g:airline_theme='murmur'
    let g:airline_powerline_fonts = 1

" different cursor for Insert,Normal,View (for vte terminals)
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"

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
    "----- javascritp ----------------
        " Plug 'pangloss/vim-javascript'
        " Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
    "---------typescript and angular -------
        Plug 'leafgarland/typescript-vim'
        " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
        " Plug 'Quramy/tsuquyomi'
    "----- extras ---------
        " Plug 'milkypostman/vim-togglelist'     " toggle location & quickfix window
        " Plug 'tpope/vim-capslock'
        " Plug 'jiangmiao/auto-pairs'
        Plug 'vim-airline/vim-airline'          " airline status bar
        Plug 'vim-airline/vim-airline-themes'
        "  Plug 'crusoexia/vim-monokai'
call plug#end()

call glaive#Install()

  " Optional: Enable codefmt's default mappings on the &lt;Leader&gt;= prefix.
    Glaive codefmt plugin[mappings]
    let g:vim_json_syntax_conceal = 0 " dont hide quotes in json
" typescript-vim
    " let g:tsuquyomi_disable_default_mappings = 1

    " let g:typescript_compiler_binary = 'tsc'
    " let g:typescript_compiler_options = ''
    " autocmd FileType typescript :set makeprg=tsc
    " autocmd QuickFixCmdPost [^l]* nested cwindow  " show errors on compile failure
    " autocmd QuickFixCmdPost    l* nested lwindow

" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
" YCM and completeopt
    let g:ycm_add_preview_to_completeopt=0
    let g:ycm_confirm_extra_conf=0
    set completeopt-=preview
    let g:ycm_key_list_select_completion = [] " unbind tab
    set omnifunc=syntaxcomplete#Complete

" syntastic with Tsquyomi
    set statusline+=%{fugitive#statusline()}
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 1
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_typescript_checkers = ["tslint"]
    " let g:syntastic_typescript_checkers = ['tsuquyomi']
    " disable syntasticCheck as default
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ["javascritpt","typescript"],'passive_filetypes': [] }
    " let g:tsuquyomi_disable_quickfix = 1

" Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets/'

" Ctrl P
    " ignore files in gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Nerd Tree
    let g:NERDTreeWinSize=25        " resize nerdtree width
" Load subconfigurations from .vimrc.d
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
  exe 'source' f
endfor

" toggle quickFix
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
