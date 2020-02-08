" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim
" ========= nvim/vim environemnt ===== {{{
    if has('nvim')
        let $VIMHOME = $HOME.'/.config/nvim'
    else
        let $VIMHOME = $HOME.'/.vim'
    endif
" }}}
" ========= Options ===== {{{
set mouse=a
set encoding=utf-8  " The encoding displayed.
scriptencoding utf-8
set fileencoding=utf-8  " The encoding written to file.
filetype plugin on
filetype indent on
syntax on
syntax enable
filetype plugin indent on       " enable filetype detection
set updatetime=300              " time for keycommands
set hidden  	        		" dont ask to save changes when switching buffers
set history=100
set autoread                    " automatically reload files changed outside of Vim"
set visualbell                  " No sounds
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
set shortmess+=I               " hide the launch screen
set nolist                      " don't show invisible characters by default,
set splitbelow                  " create new splits below
set splitright                  " create new splits to the right
set wildmenu                    " enable wildmenu
set wildmode=longest:list,full  " first tab opens longest match, 2nd tab opens menu
set completeopt=noinsert,menuone,noselect
set path+=**
set wildignore+=*/.git/*,*/node_modules/*,*/obj/*,*/bin/*,*/.DS_Store,*/vendor
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set nocompatible
" set termguicolors

setlocal tabstop=2 sts=2 sw=2 " default spacing tab width
augroup vimrcEx
  autocmd!
    " disable comment continuation
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " comment for xdefault/Xresources file
    autocmd FileType xdefaults set commentstring=!\ %s
    " set filetype for certain special fies
    autocmd BufNewFile,BufRead *eslintrc,*babelrc,*tern-project,*htmlhintrc set ft=json
    autocmd BufNewFile,BufRead .Xresources* set ft=xdefaults
augroup END

set omnifunc=syntaxcomplete#Complete
" }}}
" ========= Plugins ======= {{{
" download vim-plug if not exists
if empty(glob( $VIMHOME .'/autoload/plug.vim'))
    echom 'Installing vim-plug to' . $VIMHOME .'/autoload/plug.vim'
    silent !curl -fLo $VIMHOME/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup vimplug
        autocmd!
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif

call plug#begin()
    " Plug 'file:///home/jared/code/vim-redux-devtools', { 'do': 'npm install && npm run build' }
    Plug 'file:///home/jared/code/vim-chrome-devtools', { 'do': 'npm install && npm run build' }
    Plug 'janko/vim-test'
    Plug 'chrisbra/Colorizer'
    Plug 'hdiniz/vim-gradle'
    "---- main plugs -----
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    " ------ linting/language services----------
    if has('nvim')
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " Plug 'w0rp/ale', { 'do': 'npm install -g eslint jsonlint' }
    endif
    if has('python3')
    "------snippets--------
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
    endif
    "---- javascript & syntax files -------
    Plug 'mxw/vim-jsx'
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/jsonc.vim'
    "---- markdown  -------
    " Plug 'plasticboy/vim-markdown'
    Plug 'vimwiki/vimwiki'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    "----- extras ---------
    Plug 'jmg5e/vim-css-js-converter'
    Plug 'crusoexia/vim-monokai'
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline'
    " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'lambdalisue/suda.vim'
    Plug 'tpope/vim-dadbod'
call plug#end()
runtime! plugins/funcs.vim
runtime! plugins/s3.vim
" }}}
" ========= KeyBindings ====    {{{
" exit from insert mode with  ;;
inoremap ;; <Esc>
" insert commands without shift key
noremap ; :
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" remap buffer completion to ctrl-b
inoremap <C-x><C-b> <C-x><C-n>
" U for redo
nnoremap U <C-r>
" faster save/close/write
nnoremap <silent><Leader>q :bdelete<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>w :w<CR>
nnoremap <silent><Leader>b :buffers<CR>
nnoremap Q q
nnoremap <Leader><esc> :q!<CR>

set pastetoggle=<F4>            " paste mode
nnoremap <silent><Leader><Leader> :noh<return>
map <S-h> <Home>
map <S-l> <End>
map <S-j> <C-d>
map <S-k> <C-u>

" go next/prevous buffer
nnoremap <silent>t, :bprevious<CR>
nnoremap <silent>t. :bnext<CR>

" vim hard mode / move splits around
noremap <Up> <C-W>K
noremap <Down> <C-W>J
noremap <Left> <C-W>H
noremap <Right> <C-W>L

" close all folds
nnoremap zz zR
" open  all folds
nnoremap ZZ zM
" go mark
nnoremap gm `

" Rename
nnoremap <F2> :%s/\<<C-r><C-w>\>/
nnoremap <Leader><F2> :%s/\<<C-r><C-w>\>/

" calcualtor/evaluate line
inoremap <C-E> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" open file in vertial split
nnoremap gfs :vertical wincmd f<CR>
vnoremap <F1> "gy<Esc>:call funcs#GoogleSearch()<CR>
nnoremap <silent>q :call funcs#CloseOtherWindows()<CR>
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call funcs#HLNext()<cr>
nnoremap <silent> N   N:call funcs#HLNext()<cr>

vnoremap <c-s> :s/
command! TrimSpaces %s/\s\+$//e
command! ClearEOL %s/\r//g
command! Reload :source $MYVIMRC
command! SudoEdit :e suda://%
command! SudoWrite :w suda://%
" }}}
" ========= Swp/Backups/Undo =============== {{{
if exists('+undofile')
    if isdirectory($VIMHOME . '/tmp/undo') == 0
        echom 'creating undo directory'
        :silent !mkdir -p $VIMHOME/tmp/undo > /dev/null 2>&1
    endif
    set undofile
    set undodir=$VIMHOME/tmp/undo     " Where to store undo history
endif

if has('nvim')
    if isdirectory($VIMHOME . '/tmp/backup') == 0
        echom 'creating backup directory'
        :silent !mkdir -p $VIMHOME/tmp/backup > /dev/null 2>&1
    endif
    set backupdir=$VIMHOME/tmp/backup " Where to backup files
    set directory=$VIMHOME/tmp/swp " Where to backup files
    set undolevels=1000
endif

augroup SwpFileCheck " open as readonly if swp file exists
  autocmd!
  autocmd SwapExists * let v:swapchoice = "o"
augroup END
" }}}
" ========= Folding =============== {{{
if has('folding')
    set foldenable        " enable folding
    set foldmethod=syntax " fold based on syntax highlighting
    set foldlevelstart=99 " start editing with all folds open

    augroup folding_settings
        autocmd Filetype conf,zsh set foldmethod=marker foldlevel=0
    augroup END

    set foldtext=funcs#FoldText()
endif
" }}}
" ========= Appearance ====    {{{
set background=dark
try
    if !empty($DISPLAY)
        " set background=dark
        color monokai
    else
        color default
    endif
catch
	colorscheme default
endtry
if has('gui_running')
    set background=dark
    set guifont=Inconsolata\ 14
    set guioptions+=m  "show menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=lrbmTLce
    set guioptions+=c
endif
" }}}
" ========= FileExplorer ========= {{{
map <leader>n :Vexplore<CR>
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize = 85
let g:netrw_list_hide=netrw_gitignore#Hide()
" }}}
" ========= FZF ============== {{{
nnoremap <c-p> :FZF<CR>
" find lines in all files
command! -bang FLines call fzf#vim#grep(
     \ 'grep -vnITr --color=always --exclude-dir=".svn" --exclude-dir=".git" --exclude=tags --exclude=*\.pyc --exclude=*\.exe --exclude=*\.dll --exclude=**\assets --exclude=*\.zip --exclude=*\.gz "^$"', 
     \ 0,  
     \ {'options': '--reverse --prompt "FLines> "'})

nnoremap <silent> <leader>gr :FLines<cr>
" }}}
" ========= Ctrl-P ============== {{{
" Custom ignores for CtrlP
" let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|assets|\tmp\|DS_Store\'
" "ignore files from .gitignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_root_markers = ['package.json', '*.sln']
"
" if executable('rg') " use ripgrep if installed
"   set grepprg=rg\ --color=never
"   let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"   let g:ctrlp_use_caching = 0
" endif
" }}}
" ========= UltiSnips ======== {{{
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'
let g:UltiSnipsListSnippets='<C-x>s'

let g:UltiSnipsSnippetsDir = $VIMHOME .'/snips'
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'snips']
" }}}
" ========= LightLine Status ===== {{{
set showtabline=2  " Show tabline always
set guioptions-=e  " Don't use GUI tabline
let g:lightline = {
\          'colorscheme': 'landscape',
\          'active': {
\              'left': [
\                  ['mode', 'paste'], ['filename', 'readonly'], ['gitbranch']
\           ],
\           'right': [
\                  ['readonly', 'percent', 'lineinfo'], []
\           ]
\         },
\         'tabline' : {
\               'left': [['buffers']], 'right': [['filetype', 'fileencoding']]
\         },
\         'component_expand': {
\               'buffers': 'lightline#bufferline#buffers'
\         },
\         'component_function': {
\               'filename': 'funcs#FilenameModified',
\               'gitbranch': 'FugitiveStatusline',
\         },
\         'component_type': {
\               'buffers': 'tabsel'
\         },
\         'bufferline': {
\               'shorten_path': 0,
\               'unnamed': '_',
\         }
\       }
"}}}
" ========= COC ======== {{{
let g:coc_global_extensions=[ 'coc-tsserver', 'coc-snippets', 'coc-css', 'coc-omnisharp', 'coc-eslint', 'coc-highlight' ]
set cmdheight=2
set shortmess+=c
set signcolumn=yes
hi CocFloating ctermfg=220 ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi CocErrorFloat ctermfg=NONE ctermbg=52 guifg=#ff0000 guibg=#3f4145

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" #command! Prettier :silent %!prettier --stdin --stdin-filepath % <CR>
" key mappings in coc-mappings.vim
" }}}
" ========= ALE ========= {{{
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_fix_on_save = 0
" let g:ale_linters = {
" \        'javascript': ['eslint'],
" \        'jsx': ['eslint'],
" \        'json': ['jsonlint'],
" \        'typescript': ['tslint'],
" \        'vim': ['vint'],
" \        'css': [],
" \        'scss': []
" \       }
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '.'
" let g:ale_set_highlights = 0
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '%linter%[%severity%] - %s'
" }}}
" ========= OTHER ======== {{{
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
" refresh on save or leave insert mode
let g:mkdp_refresh_slow = 1

" set to 1, echo preview page url in command line when open preview page
let g:mkdp_echo_preview_url = 0
" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
" let g:mkdp_page_title = '「${name}」'
let g:vimwiki_list = [{'path': '~/.wiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" let g:Hexokinase_ftEnabled = ['css', 'scss', 'html']
" let g:Hexokinase_highlighters = ['foregroundfull']
" }}}
let g:ChromeDevTools_port = '9222'
let g:ChromeDevTools_host = 'localhost'
let g:ChromeDevTools_defaultUrl = 'http://localhost:3000'

" vim:foldmethod=marker:foldlevel=0
