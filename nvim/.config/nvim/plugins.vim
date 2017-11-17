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
    if has('python3')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
        Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
        " (Optional) Showing function signature and inline doc.
        Plug 'Shougo/echodoc.vim'
    endif

    "---- main plugs -----
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdTree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'w0rp/ale', { 'do': 'npm install -g eslint tslint' }

    "------snippets--------
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    "----  format code -----
    Plug 'Chiel92/vim-autoformat', {'do': 'npm install -g eslint js-beautify'}

    "----- javascritp----------------
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    "----- typescript -------
    Plug 'leafgarland/typescript-vim'
   
    "---- dotnet / c# ----------------
    " Plug 'markwoodhall/vim-nuget'
    " Plug 'mattn/webapi-vim'
    " Plug 'scrooloose/syntastic'
    " if has('python3')
        " Plug 'OmniSharp/omnisharp-vim'
        " Plug 'Robzz/deoplete-omnisharp'
    " endif
    
    "----- extras ---------
    Plug 'crusoexia/vim-monokai'
    Plug 'vim-airline/vim-airline'          " airline status bar
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'diepm/vim-rest-console'
call plug#end()

" ================ Plugin Settings ==================
" ========= Deoplet  =========
if &runtimepath =~ 'deoplete.nvim'
    let g:deoplete#enable_at_startup = 1
    " Use smartcase.
    let g:deoplete#enable_smart_case = 1
    " let g:deoplete#sources = ['omni', 'ultisnips']
    " let g:deoplete#ignore_sources.cs= ['tag']
    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.cs = ['\w*|\.*']
endif

" ========= vim-json =========
" vim-json dont hide quotes
let g:vim_json_syntax_conceal = 0 " dont hide quotes in json
autocmd InsertEnter *.json setlocal conceallevel=2 concealcursor=
autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=inc

" ========= NerdTree =========
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=30        " resize nerdtree width
let NERDTreeShowHidden=0        " hide hidden files (Shift+i) togggles this

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" ========= FZF ==============
nmap <C-p> <plug>(fzf-maps-n)
xmap <C-p> <plug>(fzf-maps-x)
omap <C-p> <plug>(fzf-maps-o)

" ========= UltiSnips ========
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ======= Rest Client ========
" let g:vrc_include_response_header=1
let g:vrc_curl_opts = {
            \ '--connect-timeout' : 10,
            \ '-ss': '',
            \ '-L': '',
            \ '-i': '',
            \ '--max-time': 60,
            \ '--ipv4': '',
            \ '-k': '',
            \}
let g:vrc_trigger = '<leader><space>'
let g:vrc_horizontal_split = 1

" AIRLINE Status bar
let g:airline#extensions#tabline#enabled =1
let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1

if &runtimepath =~ 'ale'
    source ~/.config/nvim/ale.vim
endif

if &runtimepath =~ 'LanguageClient-neovim'
    source ~/.config/nvim/langserver.vim
endif

" if &runtimepath =~ 'omnisharp-vim'
"     source ~/.config/nvim/omniSharp.vim
" endif
