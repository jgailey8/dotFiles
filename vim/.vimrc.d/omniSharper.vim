let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'
" let g:OmniSharp_server_path = "/opt/omnisharp-roslyn/"
let g:OmniSharp_server_path = "omnisharp" " calls bash script in /bin
let g:OmniSharp_start_without_solution = 1
let g:OmniSharp_prefer_global_sln = 1
" let g:Omnisharp_highlight_user_types = 1
let g:Omnisharp_start_server = 1
"This is the default value, setting it isn't actually necessary

"Set the type lookup function to use the preview window instead of the status line
" let g:OmniSharp_typeLookupInPreview = 1
" let g:OmniSharp_want_snippet=0
"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 2

let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin

"show type information automatically when the cursor stops moving
" autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Enable snippet completion, requires completeopt-=preview
" set completeopt-=preview
" let g:OmniSharp_want_snippet=1
" autocmd FileType cs let b:dispatch = 'call StartRoslyn()'

" autocmd  BufReadPost,FileReadPost *.cs  call StartRoslyn() "Start ominisharp server if not alread started
" dont know why it  doesnt start automaticly
" function! StartRoslyn()
"     if !OmniSharp#ServerIsRunning()
"         call dispatch#start('mono /opt/omnisharp-roslyn/OmniSharp.exe -p 2000 -s $PWD', {'background':1})
"     endif
" endfunction
