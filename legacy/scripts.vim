map <A-Tab> :call SwitchBuffer() <CR>
function! SwitchBuffer()
    :set showtabline=2
    :bn
    " augroup enable
    "     autocmd InsertEnter    * :set showtabline=0
    " augroup END
endfunction

map <S-Tab> :call SwitchBufferP() <CR>
function! SwitchBufferP()
    :set showtabline=2
    :bp
    " augroup enable
    "     autocmd InsertEnter    * :set showtabline=0
    " augroup END
endfunction

" delete tailing space on save (for some filetypes)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()


