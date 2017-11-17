" set rtp^=/usr/share/nvim/runtime/
" runtime! archlinux.vim
set mouse=a
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set nocompatible               " be iMproved not vi
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set splitbelow         " preview window on bottom
" realitive/current line
set relativenumber
set number
set hidden  " dont ask to save changes when switching buffers

" Switch syntax highlighting on
syntax on

" Also switch on highlighting the last used search pattern.
set hlsearch

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

syntax on
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
set completeopt=longest,menuone " omnicomplete dont auto select
" folding
setlocal foldmethod=syntax
setlocal foldlevel=99
" command tabcompletion
set wildmode=longest,list,full
set wildmenu

" viminfo stores the the state of your previous editing session
if exists("+undofile")
    set undofile           " keep an undo file (undo changes after closing)
  " This is only present in 7.3+
    " let $VIMHOME = $XDG_CONFIG_HOME.'/nvim'
    set undodir=$HOME/.local/tmp/vim-undo
endif
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \   execute "normal! g`\"" |
                \ endif

augroup END

command! ClearEOL %s/\r//g
command! Reload :source $MYVIMRC
command! SudoWrite w !sudo tee "%"
" ================ KeyBindings ==================
" exit from insert mode with  ;;
imap ;;; <Esc>

" remap colon
nmap ; :

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" quit/save faster with leader key
nnoremap <Leader>q :q<CR>
nnoremap <Leader><esc> :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>w :w<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

set pastetoggle=<F3>            " paste mode

nnoremap <Leader><Leader> :noh<return>

" more natural up down movement
" nnoremap j gj
" nnoremap k gk

" end and start of line with shift h l
map <S-h> <Home>
map <S-l> <End>

"page up down with shift j/k
map <S-j> <C-d>
map <S-k> <C-u>

" buffers go back/next with meta-b/n
nnoremap <M-b> <C-o>
nnoremap <M-n> <C-i>

source ~/.config/nvim/appearance.vim
source ~/.config/nvim/formater.vim
source ~/.config/nvim/plugins.vim
