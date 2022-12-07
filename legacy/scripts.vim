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

" to preview markdowns
" nnoremap <C-m> :silent !pandoc % -f gfm -o /tmp/vim-pandoc.html<CR>:redraw!<CR>

" nnoremap <C-m> :call RenderMarkdown() <CR>
" function! RenderMarkdown()
"     :silent !pandoc % -f gfm -o /tmp/vim-pandoc.html
"     :redraw!
" endfunction

" function! PreviewMarkdown()
"     :silent !pandoc % -f gfm -o /tmp/vim-pandoc.html
"     :redraw!
"     :!firefox /tmp/vim-pandoc.html > /dev/null 2>&1
" endfunction


" delete tailing space on save (for some filetypes)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()


function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



"##### auto fcitx  ###########
" let g:input_toggle = 1
" function! Fcitx2en()
"    let s:input_status = system("fcitx-remote")
"    if s:input_status == 2
"       let g:input_toggle = 1
"       let l:a = system("fcitx-remote -c")
"    endif
" endfunction

" function! Fcitx2zh()
"    let s:input_status = system("fcitx-remote")
"    if s:input_status != 2 && g:input_toggle == 1
"       let l:a = system("fcitx-remote -o")
"       let g:input_toggle = 0
"    endif
" endfunction

" set ttimeoutlen=150
"Exit insert mode
" autocmd InsertLeave * call Fcitx2en()
"Enter insert mode
" autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######
