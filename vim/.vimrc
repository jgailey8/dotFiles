runtime! archlinux.vim

set mouse=a
set encoding=utf-8  " The encoding displayed.
scriptencoding utf-8"
set fileencoding=utf-8  " The encoding written to file.
filetype plugin on
filetype indent on
syntax on
syntax enable
filetype plugin indent on       " enable filetype detection
set updatetime=1000             " time for keycommands
set hidden  	        		" dont ask to save changes when switching buffers
set history=100
set autoread                    " automatically reload files changed outside of Vim"
set belloff=all                 " No Bell!, This should turn off screen flicker in all case
set clipboard=unnamedplus   	" use system clipboard
set relativenumber      		" show realitve line number
set number          			" show current line number
set ruler                       " show line/position etc... in status
set showmode                    " always show what mode we're currently editing in
set laststatus=2                " always show status bar
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
set showmatch                   " show matching parenthesis
set showcmd                     " show incomplete cmds down the bottom
set ignorecase                  " ignorecase
set smartcase                   " ignore case if search pattern is all lowercase,
set smarttab                    " insert tabs on the start of a line according to
set smartindent
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set shortmess+=I                " hide the launch screen
set nolist                      " don't show invisible characters by default,
set splitbelow                  " create new splits below
set splitright                  " create new splits to the right
set wildmenu                    " enable wildmenu
set wildmode=longest:list,full  " first tab opens longest match, 2nd tab opens menu
set completeopt=menuone,preview,noselect " use popup menu when one match, dont automaticcally select match

set pastetoggle=<F3>            " paste mode

nnoremap <Leader><Leader> :noh<return>
map <S-h> <Home>
map <S-l> <End>
map <S-j> <C-d>
map <S-k> <C-u>

" go next/prevous buffer
nnoremap t, :bprevious<CR>
nnoremap t. :bnext<CR>

" vim hard mode / move splits around
noremap <Up> <C-W>K
noremap <Down> <C-W>J
noremap <Left> <C-W>H
noremap <Right> <C-W>L


nnoremap <silent>q :call CloseOtherWindows()<CR>

function! CloseOtherWindows()
	pclose
	lclose
	cclose
	helpclose
	if exists('g:NERDTree') && g:NERDTree.IsOpen()
		NERDTreeToggle
	endif
endfun "}}}
