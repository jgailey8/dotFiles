runtime dbs.vim

func! SelectDb() 
    call fzf#run({
        \   'source': map(copy(g:dadbods), {k, v -> v.name}), 
        \   'sink': function('DBSelected')
        \   })
endfunc

func! DBSelected(result)
	if a:result != -1
        for v in g:dadbods
            if v.name == a:result
                let g:db=v.url
            endif
        endfor
	endif
endfunc

function! DB_EXE()
    if exists('g:db')
        let content=join(getline(1, '$'), "\n")
        execute 'DB ' . g:db . ' ' . content
     else
         echom 'no db currently selected'
     endif
endfun 

nnoremap run :call DB_EXE()<CR>
nmap <leader>db  :call DB_EXE()<CR>
