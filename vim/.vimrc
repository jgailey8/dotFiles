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
set nocompatible               " be iMproved not vi

filetype plugin on
filetype indent on
syntax on
syntax enable

set fileformats="unix,dos,mac"
set ff=unix
set fileformat=unix

" realitive/current line
set relativenumber
set number

set guifont=Inconsolata\ for\ Powerline:h12
" Appearance settings
if !has("gui_running") && &t_Co > 255

    " AIRLINE Status bar
    let g:airline#extensions#tabline#enabled =1
    let g:airline_theme='murmur'
    let g:airline_powerline_fonts = 1

    " different cursor for Insert,Normal,View (for vte terminals)
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"

    set t_Co=256  " vim-monokai now only support 256 colours in terminal.
    " set term=rxvt-unicode-256color
    " =========== apearance/theme colors =======

    " = overide theme colors =
    if filereadable( expand("$HOME/.vim/colors/monokai.vim") )
        colorscheme monokai
        set cursorline
        set background=dark
        " highlight only line number not line
        hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
        " visual mode select bg color
        hi Visual ctermbg=DarkGrey ctermfg=NONE
        " comment color
        hi Comment ctermfg=Grey
        " transparent background
        hi Normal ctermbg=NONE
        " search colors
        " Overide omnicomplete appearance
        hi Pmenu  ctermfg=grey ctermbg=black guifg=grey60  guibg=brown
        " Overide syntastic error
        hi SpellBad    ctermfg=white ctermbg=darkred cterm=none
        hi SpellCap    ctermfg=white ctermbg=yellow cterm=none
        hi MatchParen cterm=bold,underline ctermbg=none ctermfg=darkgreen
    endif
else
    colorscheme default

    " improve omnicomplete visiblity
    hi Pmenu  ctermfg=grey ctermbg=black guifg=grey60  guibg=brown
endif

" ================================================

" ========== Undo /Persisten ========
" if !isdirectory($HOME."/.vim/undo-dir")
"     call mkdir($HOME."/.vim/undo-dir", "", 0700)
" endif
" set undodir=$HOME/.vim/undo-dir " where to save undo histories
" set undofile                    " Save undo's after file closes

" disable bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" editing  behaviour
set hidden                      " hide buffers instaed of closing
set showmode                    " always show what mode we're currently editing in
set matchtime=0                 " disables moving cursor when matching brackets
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
set ignorecase                  " ignorecase
set smartcase                   " ignore case if search pattern is all lowercase,
set smarttab                    " insert tabs on the start of a line according to
set smartindent
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set shortmess+=I                " hide the launch screen
set clipboard=unnamedplus
set autoread                    " automatically reload files changed outside of Vim"
set nolist                      " don't show invisible characters by default,
" but it is enabled for some file types (see later)
set laststatus=2        " always show status bar
set viminfo="NONE" " no annoying bkp files and .viminfo
set nobackup
set noswapfile
set completeopt=longest,menuone,preview " omnicomplete dont auto select
" folding
setlocal foldmethod=syntax
setlocal foldlevel=5

" set timeoutlen=1000 ttimeoutlen=10 "  fixes issue with delay in status change
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

let g:vim_json_syntax_conceal = 0 " dont hide quotes in json
set conceallevel=0
" Ctrl P
" ignore files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'
" Nerd Tree
let g:NERDTreeWinSize=25        " resize nerdtree width
let NERDTreeShowHidden=0        " hide hidden files (Shift+i) togggles this


function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

autocmd  BufReadPost,FileReadPost   *.cs  :e ++ff=dos "hide ^m eol when opening cs file

" ================ Custom Commands====================== "
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
command! ClearEOL %s/\r//g
command! Reload :source $MYVIMRC
command! SudoWrite w !sudo tee "%"

" ---------------------------------------------------- "
" ================ KEY BINDINGS ====================== "
" ---------------------------------------------------- "
" hard mode
" map <UP>    <NOP>
" map <DOWN>  <NOP>
" map <LEFT>  <NOP>
" map <RIGHT> <NOP>

" exit from insert mode with  ;;
imap oj <Esc>

" remap colon
nmap ; :

"disable ex-mode
map Q <Nop>

" quit/save faster with leader key
nnoremap <Leader>q :q<CR>
nnoremap <Leader><esc> :q!<CR>
nnoremap <Leader>w :w<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" new line without going to insert mode
" nnoremap O o <esc>

nnoremap <Leader>w :w<CR>
set pastetoggle=<F3>            " paste mode

nnoremap <Leader><Leader> :noh<return>

" ====easier navigation=====
" Better window navigation -Ctrl+j,k etc..
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" more natural up down movement
nnoremap j gj
nnoremap k gk
" Omnicomplete j k navigation
" inoremap <expr> <C-j> ("\<C-n>")
" inoremap <expr> <C-k> ("\<C-p>")
" end and start of line with shift h l
map <S-h> <Home>
map <S-l> <End>

"page up down with shift j/k
map <S-j> <C-d>
map <S-k> <C-u>

" show buffer list with Control b
nnoremap <C-b> :buffers<CR>:buffer<Space>

" show nerdtree with Control n
map <C-n> :NERDTreeToggle<CR>

" ================================================================
" ========== NEOCOMPLETE / NEOSNIPPET keybinds ===================
" ================================================================
" Move up and down in autocomplete with Control j/k
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" neocomplete - scroll popup with ctrl-j/k
inoremap <expr><C-j> pumvisible() ?  "\<C-n>" : "\<C-j>"
" inoremap <expr><C-k> pumvisible() ?  "\<C-p>" : "\<C-k>"
" smart C-k scroll omnicomplete and expand snippets
imap <expr><C-k> pumvisible() ? "<C-p>" : neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" ================================================================

" Enable folding with the spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" FOLD ALL
nnoremap zA zM
" UNFOLD ALL
nnoremap Za zR

" search and replace hotkey
nnoremap <Leader>sr :%s/wordToReplace/replaceWith/gc
if !has('nvim')
    " Neovim specific commands
    for f in split(glob('~/.vimrc.d/*.vim'), '\n')
        exe 'source' f
    endfor
endif
" Load subconfigurations from .vimrc.d
" for f in split(glob('~/.vimrc.d/*.vim'), '\n')
"     exe 'source' f
" endfor
