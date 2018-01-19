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
set updatetime=2000             " shorten time for keycommands
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
set completeopt=menuone,preview,noselect " use popup menu when one match, dont automaticcally select match
" set switchbuf=usetab,newtab
" }}}
" ========= KeyBindings ====    {{{
" exit from insert mode with  ;;
imap ;; <Esc>
nmap ; : 	" remap colon
noremap Q gq 	"Don't use Ex mode
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
nnoremap <Leader>q :q<CR> 	" quit/save faster with leader key
nnoremap <Leader>c :bdelete<CR> 	" close current buffer
nnoremap <Leader><esc> :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>w :w<CR>
nnoremap U <C-r>                " remap U to <C-r> for easier redo
set pastetoggle=<F3>            " paste mode
nnoremap <Leader><Leader> :noh<return>
map <S-h> <Home> 		" HOME/END with H & L
map <S-l> <End>
map <S-j> <C-d> " page up down with shift j/k
map <S-k> <C-u>
" go next/prevous buffer
nnoremap tp :bp<CR>
nnoremap tn :bn<CR>
" nnoremap <M-b> :bp<CR>
" nnoremap <M-n> :bn<CR>
inoremap <C-Space> <C-x><C-o>

" close all folds
nnoremap zz zR
" open  all folds
nnoremap ZZ zM
" }}}
" ========= Plugins ======= {{{
try
call plug#begin()
    "---- main plugs -----
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdTree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    " ------ linting/language services----------
    if has('nvim')
        Plug 'w0rp/ale', { 'do': 'npm install -g eslint tslint prettier' }
        " Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*-x86_64-unknown-linux-musl', 'do': 'npm install -g javascript-typescript-langserver' }
        Plug 'prabirshrestha/async.vim'
        Plug 'prabirshrestha/vim-lsp', { 'do': 'npm install -g javascript-typescript-langserver' }
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-lsp.vim'
        Plug 'yami-beta/asyncomplete-omni.vim'
        Plug 'prabirshrestha/asyncomplete-file.vim'
        " Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
    endif

    "------snippets--------
    if has('python3')
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        " Plug 'maralla/completor.vim'
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    endif
    "----  format code -----
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    " Plug 'Chiel92/vim-autoformat'
    "----- javascript----------------
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    "----- typescript -------
    Plug 'leafgarland/typescript-vim'
   
    "---- dotnet / c# ----------------
    Plug 'OrangeT/vim-csharp'
    " Plug 'markwoodhall/vim-nuget'
    " Plug 'mattn/webapi-vim'
    
    "----- extras ---------
    Plug 'airblade/vim-gitgutter'
    Plug 'crusoexia/vim-monokai'
    " Plug 'dracula/vim'
    " Plug 'chriskempson/base16-vim'
    Plug 'vim-airline/vim-airline'          " airline status bar
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'diepm/vim-rest-console'
call plug#end()
catch 
    echom 'installing vim-plug'
    " attempt to download the plugin manager, if it is missing
    if has('nvim')
        " neovim
        runtime! python setup.vim
        let $vimhome = $XDG_CONFIG_HOME.'/nvim'
        echom 'installing vim-plug to: '. $vimhome
        silent! call mkdir($vimhome.'/autoload', 'p')
        silent! execute '!curl -flo '.$vimhome.'/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    else
        let $vimhome = $HOME.'/.vim'
        echom 'installing vim-plug to: '. $vimhome
        silent! call mkdir($vimhome.'/autoload', 'p')
        silent! execute '!curl -flo '.$vimhome.'/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif
endtry
" }}}
" ========= backups/Undo =============== {{{
if has('nvim')
    set undofile                " Keep undo history even after closing Vim
    set undodir=~/.config/nvim/tmp/undo     " Where to store undo history
    set backupdir=~/.config/nvim/tmp/backup " Where to backup files
    set directory=~/.config/nvim/tmp/swp " Where to backup files
    set undolevels=1000
endif
if !has('nvim')
    set undofile                " Keep undo history even after closing Vim
    set undodir=~/.vim/tmp/undo     " Where to store undo history
    set backupdir=~/.vim/tmp/backup " Where to store undo history
endif
" }}}
" ========= Formatting ============== {{{
augroup autoformat_settings
    let g:prettier#config#bracket_spacing = 'true'
    command! FormatDocument Autoformat

    autocmd Filetype javascript* nnoremap <leader>F :ALEFix<CR>
    " autocmd Filetype javascript* command! FormatDocument :ALEFix<CC>

    command! FormatDocument :Prettier<CR>
    autocmd Filetype typescript,html,javascript setlocal ts=2 sts=2 sw=2
    autocmd Filetype python setlocal ts=8 sts=4 sw=4 expandtab
    autocmd Filetype python set list                      " show invisible characters by default,
    autocmd Filetype python set listchars=trail:.

    " let g:formatters_typescript = ['clangformat', 'tsfmt']
    " " let g:formatters_javascript = ['prettier']
    " let g:formatterpath = ['~/.local/node_modules/bin', '/usr/bin']

    " " debug autoformat
    " let g:autoformat_verbosemode=1

    " change comment string for files
    autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
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

  set foldtext=FoldText()
  function! FoldText()
    let l:lpadding = &foldcolumn
    redir => l:signs
      execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~# 'id=' ? 2 : 0

    if exists('+relativenumber')
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      elseif (&relativenumber)
        let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
      endif
    else
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, '.', 'x', 'g'))) . l:info
  endfunction
endif
" }}}
" ========= Appearance ====    {{{

set background=dark
set cursorline
try
    color monokai
    " transparent background
    hi Normal ctermbg=NONE guibg=NONE
catch 
    echom 'Error loading apearance settings'
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
    " let NERDTreeShowHidden=0        " hide hidden files (Shift+i) togggles this
catch
endtry
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
" }}}
" ========= Ctrl-P ============== {{{
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}
" ========= UltiSnips ======== {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'
let g:UltiSnipsListSnippets='<C-x>s'
" }}}
" ========= Airline Status ===== {{{
" let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'tabline', 'ale']
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='base16_google'
" let g:airline_theme='dark'
" let g:airline_theme='murmur'
" }}}
" ========= Fugitive / Git  ========== {{{
nnoremap <leader>gge :GitGutterEnable<cr>
nnoremap <leader>ggd :GitGutterDisable<cr>
" }}}
" ========= LSP ========= {{{

augroup registerServer
  autocmd!
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
endif
if executable('javascript-typescript-stdio')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
endif

if executable('node')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'omnisharp-language-server',
        \ 'cmd': {server_info->['node', expand('~/.local/omnisharp-node-client/languageserver/server.js')]},
        \ 'whitelist': ['cs'],
        \ })
endif

let g:lsp_async_completion = 1
let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
augroup END

augroup LSP_Mappings
    autocmd!

    autocmd FileType javascript setlocal omnifunc=lsp#complete
    autocmd FileType typescript setlocal completefunc=lsp#complete
    autocmd FileType cs setlocal completefunc=lsp#complete

    autocmd FileType javascript,typescript,cs noremap <silent> <leader>h :LspHover<CR>
    autocmd FileType javascript,typescript,cs noremap <silent> gd :LspDefinition<CR>
    autocmd FileType javascript,typescript,cs noremap <silent> <leader>s :LspDocumentSymbol<CR>
    autocmd FileType javascript,typescript,cs noremap <silent> <F2> :LspRename<CR>
    autocmd FileType javascript,typescript,cs noremap <silent> <leader>r :LspRename<CR>
    autocmd FileType javascript,typescript,cs noremap <silent> <leader>e :LspDocumentDiagnostics<CR>
augroup END
" }}}
" ========= ASYNCOMPLETE ========= {{{
" let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1
" let g:asyncomplete_completion_delay = 500
augroup registerAsyncCompleteSouces
  autocmd!
" Omnicomplete 
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \ 'name': 'omni',
        \ 'whitelist': ['*'],
        \ 'blacklist': ['html', 'typescript', 'cs', 'javascript', 'javascript.jsx'],
        \ 'priority': 15,
        \ 'completor': function('asyncomplete#sources#omni#completor')
        \  }))

" File completion
    call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'whitelist': ['*'],
        \ 'priority': 10,
        \ 'completor': function('asyncomplete#sources#file#completor')
        \ }))
augroup END
inoremap <silent><expr><C-space> asyncomplete#force_refresh()
" }}}
" ========= ALE ========= {{{
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_fix_on_save = 0

let g:ale_linters = {
\           'jsx': ['eslint'], 
\           'javascript': ['eslint'],
\           'json': ['jsonlint'],
\           'css': ['stylelint'],
\           'typescript': ['tslint'],
\           'cs': []}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['stylelint']
\}

let g:ale_sign_error = 'xx'
let g:ale_sign_warning = '--'
let g:ale_set_highlights = 0 " disable highlighting

" show error msg in status bar
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" jsx support
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let g:ale_linter_aliases = {'jsx': 'css'}

let g:airline#extensions#ale#enabled = 1    " show erors/warnings in status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   l:all_non_errors,
    \   l:all_errors
    \)
endfunction
set statusline=%{LinterStatus()}

nnoremap ale :ALEFix<CR>
nnoremap alet :ALEToggle<CR>
nnoremap aled :ALEGoToDefinition<CR>
" }}}
" ========= DEOPLETE ========= {{{

" let g:completor_javascript_omni_trigger = "\\w+$|[\\w\\)\\]\\}\'\"]+\\.\\w*$"
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#complete_method = 'omnifunc'

" let g:deoplete#omni#functions.javascript.jsx = 'lsp#Complete'

" let g:deoplete#omni#input_patterns.javascript.jsx = '[^. *\t]\.\w*'
" call deoplete#custom#source('buffer',
" 		\ 'filetypes', ['c', 'cpp'])
" let g:deoplete#omni#functions.javascript = [
" 		  \ 'js#Complete',
"           \ 'lsp#complete',
" 		  \]
" }}}
" ========= OTHER ========= {{{
" mxm/vim-jsx
let g:jsx_ext_required = 0 " enable jsx for .js files
" }}}
" ========= Functions/Commands ====    {{{

" quickly close preview,location-list,quickfix windows
function! CloseOtherWindows()
	pclose
	lclose
	cclose
	helpclose
	if exists('g:NERDTree') && g:NERDTree.IsOpen()
		NERDTreeToggle
	endif
endfun
nnoremap <silent>q :call CloseOtherWindows()<CR>

command! ClearEOL %s/\r//g
command! Reload :source $MYVIMRC
command! SudoWrite w !sudo tee % > /dev/null

augroup vimrcEx
  autocmd!
    " disable comment continuation
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " better syntax highlighting for eslintrc and babelrc
    autocmd BufNewFile,BufRead *eslintrc,*babelrc,*tern-project,*htmlhintrc setlocal syntax=json

    autocmd FileType css set omnifunc=csscomplete#CompleteCSS

    " open help menu to the right
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif

    " set omnifunc to syntax complete if not already set 
    if has('autocmd') && exists('+omnifunc')
    autocmd Filetype *
            \	if &omnifunc == "" |
            \		setlocal omnifunc=syntaxcomplete#Complete |
            \	endif
endif
augroup END
" }}}

" ========= LanguageClient ========= {{{
" let g:LanguageClient_serverCommands = {
"     \ 'typescript': ['javascript-typescript-stdio'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['javascript-typescript-stdio'],
"     \ 'cs': ['node', '~/.local/omnisharp-node-client/languageserver/server.js'],
"     \ }
"     let g:LanguageClient_selectionUI = 'location-list'
"     let g:LanguageClient_rootMarkers = {
"         \ 'javascript': ['project.json'],
"         \ 'javascript.jsx': ['project.json'],
"         \ 'typescript': ['tsconfig.json'],
"         \ }

"         " \ 'cs': ['*.csproj'],
" augroup LanguageClient_Mappings
"     autocmd!
"     autocmd FileType javascript.jsx,typescript,cs noremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
"     autocmd FileType javascript.jsx,typescript,cs noremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"     autocmd FileType javascript.jsx,typescript,cs noremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"     autocmd FileType javascript.jsx,typescript,cs noremap <silent> <leader>F :call LanguageClient_textDocument_formatting()<CR>
"     autocmd FileType javascript.jsx,typescript,cs noremap <silent> <leader>r :call LanguageClient_textDocument_references()<CR>
"     autocmd FileType javascript.jsx,typescript,cs noremap <silent> <leader>ca :call LanguageClient_textDocument_codeAction()<CR>
"     autocmd FileType javascript.jsx,typescript,cs nmap <buffer> <c-h> <Plug>IMAP_JumpForward
"     autocmd FileType javascript.jxs,typescript,cs imap <C-space> call LanguageClient_textDocument_completion()<CR>
" augroup END
" imap <C-space> call LanguageClient_textDocument_completion()<CR>
" autocmd FileType cs imap <c-space> :call LanguageClient_textDocument_completion()
" }}}

" vim:foldmethod=marker:foldlevel=0
