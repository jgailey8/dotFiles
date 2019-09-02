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
set shortmess+=I                " hide the launch screen
set nolist                      " don't show invisible characters by default,
set splitbelow                  " create new splits below
set splitright                  " create new splits to the right
set wildmenu                    " enable wildmenu
set wildmode=longest:list,full  " first tab opens longest match, 2nd tab opens menu
set completeopt=noinsert,menuone,noselect
set path+=**
set wildignore+=*/.git/*,*/node_modules/*,*/obj/*,*/bin/*,*/.DS_Store,*/vendor
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico

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
    "---- main plugs -----
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    " Plug 'scrooloose/nerdTree'
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    " Plug 'aserebryakov/vim-todo-lists'
    " ------ linting/language services----------
    if has('nvim')
        Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
        Plug 'w0rp/ale', { 'do': 'npm install -g eslint jsonlint' }
    endif
    if has('python3')
        Plug 'OmniSharp/omnisharp-vim'
    "------snippets--------
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
    endif
    "---- javascript & syntax files -------
    Plug 'mxw/vim-jsx'
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/jsonc.vim'
    "----- extras ---------
    Plug 'jmg5e/vim-css-js-converter'
    Plug 'crusoexia/vim-monokai'
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline'
    Plug 'suan/vim-instant-markdown', { 'do': 'npm install -g instant-markdown-d', 'for': 'markdown' }
    Plug 'chrisbra/Colorizer'
    Plug 'lambdalisue/suda.vim'
    " Plug 'chrisbra/csv.vim'
    " Plug 'ryanoasis/vim-devicons'
call plug#end()
runtime! plugins/funcs.vim
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
        set background=dark
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
" ========= NerdTree/FileExplorer ========= {{{
try
    map <leader>n :NERDTreeToggle<CR>
    let g:NERDTreeWinSize=30        " resize nerdtree width
    let g:NERDTreeWinPos = 'right'
catch
    map <leader>n :Vexplore<CR>
    let g:netrw_banner=0
    let g:netrw_browse_split=4
    let g:netrw_liststyle=3
    let g:netrw_list_hide=netrw_gitignore#Hide()
endtry
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
set cmdheight=2
set shortmess+=c
set signcolumn=yes

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
" nmap <F2> <Plug>(coc-rename)
nnoremap coc <Esc>:CocList<CR>
" open up quick fix winow(not sure which mapping i will use yet)
nnoremap er :cw<CR>
nnoremap <leader>er <Esc>:CocList diagnostics<CR>
nmap <leader>ca <Plug>(coc-codeaction)
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
if &filetype == 'vim'
    execute 'h '.expand('<cword>')
else
    call CocActionAsync('doHover')
endif
endfunction

" Use `:Format` for format current buffer
command! -nargs=0 CocFormat :call CocAction('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" }}}
" ========= ALE ========= {{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 0
let g:ale_linters = {
\        'javascript': ['eslint'],
\        'jsx': ['eslint'],
\        'json': ['jsonlint'],
\        'typescript': ['tslint'],
\        'vim': ['vint'],
\        'cs': ['omnisharp'],
\        'css': [],
\        'scss': []
\       }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '%linter%[%severity%] - %s'
" }}}
" ========= OTHER ======== {{{
let g:instant_markdown_autostart = 0

"disable moving items after toggle,
let g:VimTodoListsMoveItems = 0
" set date insert
" let g:VimTodoListsDatesEnabled = 1
" let g:VimTodoListsDatesFormat = "%a %b, %Y"
" }}}
" vim:foldmethod=marker:foldlevel=0
