" This file holds unused code, they are no longer used but worth keeping as a reference...
" This file MUST NOT be souced into the config. If you want to use any of these, copy-paste
" the snippets to where they should be .


" fcitx auto toggle..
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"Exit insert mode
autocmd InsertLeave * call Fcitx2en()
"Enter insert mode
autocmd InsertEnter * call Fcitx2zh()


" to preview markdowns, without a plugin.. (using system's pandoc)
nnoremap <C-m> :silent !pandoc % -f gfm -o /tmp/vim-pandoc.html<CR>:redraw!<CR>

nnoremap <C-m> :call RenderMarkdown() <CR>
function! RenderMarkdown()
    :silent !pandoc % -f gfm -o /tmp/vim-pandoc.html
    :redraw!
endfunction

function! PreviewMarkdown()
    :silent !pandoc % -f gfm -o /tmp/vim-pandoc.html
    :redraw!
    :!firefox /tmp/vim-pandoc.html > /dev/null 2>&1
endfunction

" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" change the behavior of the <Enter> key when the popup menu is visible. In that
" case the Enter key will simply select the highlighted menu item, just as <C-Y>
" does. &&
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" UPDATE: note needed in nvim wieh nvim-cmp
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"



" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
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

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" ignore some files in menu: we have better menu, which handles this for us..
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Avoid garbled characters in Chinese language windows OS
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" better split bar
highlight VertSplit guibg=NONE
highlight VertSplit ctermbg=NONE

" delete tailing space on save (for some filetypes)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

" this command enforces:
" - at the beginning of lines, use <TAB> as identations
" - inside of the lines, use spaces for tabulation
" a handy command to retab spaces at BEGINNING of lines only
command! RetabIndents retab!|call RetabIndents()
func! RetabIndents()
    let default_tab = &expandtab
    set et
    let saved_view = winsaveview()
    execute '%s@^\(\ \{'.&ts.'\}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@e'
    let &expandtab=default_tab
    call winrestview(saved_view)
endfunc

" :W sudo saves the file
" this normally won't work... use sudoedit instead.
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
