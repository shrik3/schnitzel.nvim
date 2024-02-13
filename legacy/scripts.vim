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

