" platform specific initialisation {{{
if has('nvim')
    " neovim
    runtime! python setup.vim
    let $VIMHOME = $XDG_CONFIG_HOME.'/nvim'
    silent! mkdir(expand($VIMHOME), "p")
else
    let $VIMHOME = $HOME.'/.vim'
endif
" attempt to download the plugin manager, if it is missing
if empty(glob($VIMHOME.'/autoload/plug.vim'))
    silent! call mkdir($VIMHOME."/autoload", "p")
    silent! execute "!curl -fLo ".$VIMHOME."/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

call plug#begin()
    "---- completion -----
    " if has('python3')
    "     if has('nvim')
    "         Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "     else
    "         Plug 'Shougo/deoplete.nvim'
    "         Plug 'roxma/nvim-yarp'
    "         Plug 'roxma/vim-hug-neovim-rpc'
    "     endif
    "     " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "     " (Optional) Showing function signature and inline doc.
    " Plug 'Shougo/echodoc.vim'
    " endif
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp', { 'do': 'npm install -g javascript-typescript-langserver' }
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'yami-beta/asyncomplete-omni.vim'
	" Plug 'prabirshrestha/asyncomplete-buffer.vim'
    Plug 'prabirshrestha/asyncomplete.vim'

    " Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
    "---- main plugs -----
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdTree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'w0rp/ale', { 'do': 'npm install -g eslint tslint' }

    "------snippets--------
    if has('python3')
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        " Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
    endif

    "----  format code -----
    Plug 'Chiel92/vim-autoformat'

    "----- javascritp----------------
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    "----- typescript -------
    Plug 'leafgarland/typescript-vim'
   
    "---- dotnet / c# ----------------
    " Plug 'markwoodhall/vim-nuget'
    " Plug 'mattn/webapi-vim'
    
    "----- extras ---------
    Plug 'crusoexia/vim-monokai'
    Plug 'vim-airline/vim-airline'          " airline status bar
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    " Plug 'diepm/vim-rest-console'
call plug#end()

" ================ Plugin Settings ==================

" ========= vim-json =========
" vim-json dont hide quotes
" let g:vim_json_syntax_conceal = 0 " dont hide quotes in json
" autocmd InsertEnter *.json setlocal conceallevel=2 concealcursor=
" autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=inc

" ========= NerdTree =========
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=30        " resize nerdtree width
let NERDTreeShowHidden=0        " hide hidden files (Shift+i) togggles this

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" ========= FZF ==============
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ========= UltiSnips ========
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ======= Rest Client ========
" let g:vrc_include_response_header=1
" let g:vrc_curl_opts = {
"             \ '--connect-timeout' : 10,
"             \ '-ss': '',
"             \ '-L': '',
"             \ '-i': '',
"             \ '--max-time': 60,
"             \ '--ipv4': '',
"             \ '-k': '',
"             \}
" let g:vrc_trigger = '<leader><space>'
" let g:vrc_horizontal_split = 1

" AIRLINE Status bar
let g:airline#extensions#tabline#enabled =1
let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1

if &runtimepath =~ 'ale'
    source ~/.config/nvim/ale.vim
endif

" if &runtimepath =~ 'LanguageClient-neovim'
"     source ~/.config/nvim/langserver.vim
" endif
if &runtimepath =~ 'lsp'
    source ~/.config/nvim/lsp.vim
endif
