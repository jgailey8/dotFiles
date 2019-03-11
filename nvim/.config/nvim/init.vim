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
set visualbell                  "No sounds
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
" set completeopt=menuone,preview,noselect " use popup menu when one match, dont automaticcally select match
" IMPORTANTE: :help Ncm2PopupOpen for more information
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
    Plug 'scrooloose/nerdTree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }

    " ------ linting/language services----------
    if has('nvim')
        " tslint jsonlint stylelint
        Plug 'w0rp/ale', { 'do': 'npm install -g eslint jsonlint' }
        " Plug 'autozimu/LanguageClient-neovim', {
        "     \ 'branch': 'next',
        "     \ 'do': 'bash install.sh',
        "     \ }
        Plug 'prabirshrestha/async.vim'
        Plug 'prabirshrestha/vim-lsp', { 'do': 'npm update -g javascript-typescript-langserver typescript-language-server' }
        " Plug 'prabirshrestha/asyncomplete.vim'
        " Plug 'prabirshrestha/asyncomplete-lsp.vim'
        " Plug 'yami-beta/asyncomplete-omni.vim'
        " Plug 'prabirshrestha/asyncomplete-buffer.vim'
        " Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
        " Plug 'prabirshrestha/asyncomplete-tags.vim'
        " Plug 'prabirshrestha/asyncomplete-file.vim'
    endif
    if has('python3')
        Plug 'OmniSharp/omnisharp-vim'
    "------completion--------
        Plug 'ncm2/ncm2'
        Plug 'roxma/nvim-yarp'
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-cssomni'
        Plug 'ncm2/ncm2-vim-lsp'
        Plug 'ncm2/ncm2-ultisnips'
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "------snippets--------
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
    endif
    "---- dotnet / c# ----------------
    Plug 'OrangeT/vim-csharp'

    "---- javascript & syntax files -------
    " Plug 'jelera/vim-javascript-syntax'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    " Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'sheerun/vim-polyglot'
    "----- extras ---------
    Plug 'jmg5e/vim-css-js-converter'
    Plug 'crusoexia/vim-monokai'
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline'
    Plug 'diepm/vim-rest-console'
    Plug 'suan/vim-instant-markdown', { 'do': 'npm install -g instant-markdown-d', 'for': 'markdown' }
    Plug 'chrisbra/Colorizer'
    Plug 'lambdalisue/suda.vim'
    " unused {{{
    " Plug 'janko-m/vim-test'
    " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    " }}}
call plug#end()

" ==== My Plugins ===
    runtime! plugins/funcs.vim
    " runtime! plugins/dragvisuals.vim
" ===================
" }}}
" ========= KeyBindings ====    {{{
" exit from insert mode with  ;;
inoremap ;; <Esc>
" insert commands without shift key
noremap ; :
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" U for redo
nnoremap U <C-r>
" faster save/close/write
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :buffers<CR>
nnoremap Q q
nnoremap <Leader><esc> :q!<CR>

" open up quick fix winow(not sure which mapping i will use yet)
nnoremap err :cw<CR>

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

" buffer complete
inoremap <C-Space> <C-x><C-o>

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
vnoremap <c-s> :s/
command! TrimSpaces %s/\s\+$//e
command! ClearEOL %s/\r//g
command! Reload :source $MYVIMRC
command! SudoEdit :e suda://%
command! SudoWrite :w suda://%

" plugin mappings
nnoremap <leader>gge :GitGutterEnable<cr>
nnoremap <leader>ggd :GitGutterDisable<cr>


augroup AleBindings
    autocmd FileType css,scss,javascript nnoremap ale :ALEFix<CR>
    autocmd FileType css,scss,javascript nnoremap alet :ALEToggle<CR>
    autocmd FileType css,scss,javascript nnoremap aled :ALEGoToDefinition<CR>
augroup END
augroup LanguageClientBindings
    autocmd!
    " autocmd FileType javascript,typescript,css,scss call LanguageClientKeyMaps()
augroup END
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
" set cursorline
try
    if !empty($DISPLAY)
        set background=dark
        color monokai
        " transparent background
        " hi Normal ctermbg=NONE guibg=NONE
    else
        color default
    endif
catch
    echom 'error loading apearance settings'
	colorscheme default
endtry

if has('gui_running')
    set background=dark
    set guifont=Inconsolata\ 14
    set guioptions+=m  "show menu bar
    set guioptions-=T  "remove toolbar
    " set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    " no annoying dialogs on close
    " set guioptions+=lrbmTLce
    set guioptions-=lrbmTLce
    set guioptions+=c
endif
" }}}
" ========= NerdTree/FileExplorer ========= {{{
try
    map <leader>n :NERDTreeToggle<CR>
    let g:NERDTreeWinSize=30        " resize nerdtree width
    let g:NERDTreeWinPos = 'right'
    " let NERDTreeShowHidden=0        " hide hidden files (Shift+i) togggles this
catch
    map <leader>n :Vexplore<CR>
    let g:netrw_banner=0
    let g:netrw_browse_split=4
    let g:netrw_liststyle=3
    let g:netrw_list_hide=netrw_gitignore#Hide()
endtry
" }}}
" ========= Ctrl-P ============== {{{
" Custom ignores for CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|tmp\|DS_Store\'
"ignore files from .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_root_markers = ['package.json', '*.sln']
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
\                  ['mode', 'paste'], ['filename', 'readonly'], ['gitbranch', 'diffHelp']
\           ],
\           'right': [
\                  ['readonly', 'percent', 'lineinfo'],
\                  ['null', 'linterErrors', 'linterWarnings', 'linterStatus'],
\           ]
\         },
\         'tabline' : {
\               'left': [['buffers']], 'right': [['filetype', 'fileencoding']]
\         },
\         'component': {
\               'null': ''
\         },
\         'component_expand': {
\               'buffers': 'lightline#bufferline#buffers'
\         },
\         'component_function': {
\               'filename': 'funcs#FilenameModified',
\               'diffHelp': 'funcs#DiffStatus',
\               'gitbranch': 'FugitiveStatusline',
\         },
\         'component_type': {
\               'buffers': 'tabsel',
\               'linterWarnings': 'warning',
\               'linterErrors': 'error',
\         },
\         'bufferline': {
\               'shorten_path': 0,
\               'unnamed': '_',
\         }
\       }

" let g:lightline#bufferline#enable_devicons=1
" let g:lightline#bufferline#unicode_symbols=1
" let g:lightline#bufferline#show_number  = 0
" let g:lightline#bufferline#shorten_path = 0
" let g:lightline#bufferline#unnamed      = '*'
" let g:lightline.colorscheme = 'palenight'
"}}}
" ========= ALE ========= {{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 0
" let g:ale_javascript_eslint_use_global = 1
" let g:ale_javascript_eslint_executable='eslint-global'
" \        'scss': ['stylelint'],
let g:ale_linters = {
\        'javascript': ['eslint'],
\        'json': ['jsonlint'],
\        'typescript': ['tslint'],
\        'vim': ['vint'],
\        'cs': ['omnisharp'],
\        'css': [],
\        'scss': [],
\       }

let g:ale_fixers = {
\        'javascript': ['eslint'],
\        'json': ['prettier']
\       }

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_set_highlights = 0 " disable highlighting

" show error msg in status bar
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '%linter%[%severity%] - %s'

" let g:ale_linter_aliases = {'jsx': 'css'}

let g:airline#extensions#ale#enabled = 1    " show erors/warnings in status line
" }}}
" ========= OTHER PLUGINS ========= {{{
" --- vim-rest-client ---
    let g:instant_markdown_autostart = 0
    let g:vrc_curl_opts = {
        \ '--connect-timeout' : 10,
        \ '--silent': '',
        \ '--include': '',
        \ '-L': '',
        \ '--max-time': 60,
        \ '--ipv4': '',
        \ '--insecure': '',
        \}

    let g:vrc_split_request_body = 1
" }}}
" ========= LSP ========= {{{
" unused servers {{{
" \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
" \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
" }}}
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_enabled = 0
" let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
augroup registerLspServers
    autocmd!
    if executable('css-languageserver')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'css-languageserver',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
            \ 'whitelist': ['css', 'less', 'sass', 'scss'],
            \ })
    endif
    if executable('typescript-language-server')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'javascript-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
            \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
            \ 'priority': 1,
            \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
            \ })
    endif
augroup END
" }}}
" ========= NCM2 ========= {{{
    " enable ncm2 for all buffers
    augroup NCM2_ENABLE
        autocmd!
        autocmd BufEnter * call ncm2#enable_for_buffer()
    augroup END
    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c
"}}}

" " ========= DEOPLETE ========= {{{
"
" let g:deoplete#enable_at_startup = 1
"
" " Disable the candidates in Comment/String syntaxes.
" call deoplete#custom#source('_',
"             \ 'disabled_syntaxes', ['Comment', 'String'])
"
" " ignored sources
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ['buffer', 'around']
" " }}}
" " ========= LanguageClient ========= {{{
" " unused servers {{{
" "   'javascript': ['javascript-typescript-stdio'],
" " 'javascript': ['typescript-language-server', '--stdio'],
" " 'javascript': ['flow-language-server', '--stdio'],
" " 'typescript': ['typescript-language-server', '--stdio'],
" " 'cpp': ['cquery'],
" " 'c': ['cquery'],
" " 'python': ['/Users/aenayet/pyenv/nvim3/bin/pyls'],
" " 'rust': ['rustup', 'run', 'stable', 'rls'],
" " 'haskell': ['hie-wrapper']
" " }}}
" let g:LanguageClient_serverCommands = {
"                 \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
"                 \ 'typescript': ['javascript-typescript-stdio'],
"                 \ 'css': ['css-languageserver', '--stdio'],
"                 \ 'scss': ['css-languageserver', '--stdio']
"                 \ }
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_rootMarkers = {
"             \ 'typscript': ['tsconfig.json'],
"             \ 'javascript': ['package.json'],
"             \ 'cs': ['*.csproj'],
"             \ }
"
" let g:LanguageClient_diagnosticsEnable=1
" " set completefunc=LanguageClient#complete
" " set formatexpr=LanguageClient_textDocument_rangeFormatting()
" }}}
" " ========= Aysnc Complete ========= {{{
" if has('python3')
"     call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"         \ 'name': 'ultisnips',
"         \ 'whitelist': ['*'],
"         \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"         \ }))
" endif
" " au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
" "     \ 'name': 'file',
" "     \ 'whitelist': ['*'],
" "     \ 'priority': 10,
" "     \ 'completor': function('asyncomplete#sources#file#completor')
" "     \ }))
" " call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
" "     \ 'name': 'buffer',
" "     \ 'whitelist': ['*'],
" "     \ 'blacklist': ['go'],
" "     \ 'priority': 10,
" "     \ 'completor': function('asyncomplete#sources#buffer#completor'),
" "     \ }))
" " call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
" "     \ 'name': 'omni',
" "     \ 'whitelist': ['scss', 'css'],
" "     \ 'blacklist': ['html'],
" "     \ 'completor': function('asyncomplete#sources#omni#completor')
" "     \  }))
" " au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
" "     \ 'name': 'tags',
" "     \ 'whitelist': ['*'],
" "     \ 'completor': function('asyncomplete#sources#tags#completor'),
" "     \ 'config': {
" "     \    'max_file_size': 50000000,
" "     \  },
" "     \ }))
" "}}}
" vim:foldmethod=marker:foldlevel=0
