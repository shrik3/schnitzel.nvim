" -- LUA Load the main lua config-----------------------
" -- ---------------------------------------------------
lua << EOF
    require"init"
EOF

if exists("g:neovide")
    source ~/.config/nvim/archived/neovide.vim
endif

" -- Custom Scripts(one liners)-------------------------
" -- ---------------------------------------------------
map <A-Tab> :call SwitchBuffer() <CR>
map <S-Tab> :call SwitchBufferP() <CR>
function! SwitchBuffer()
    :set showtabline=2
    :bn
endfunction

function! SwitchBufferP()
    :set showtabline=2
    :bp
endfunction

" a better retab functoin
:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

" return to last edit pos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime

" -- Filetype perks ...........-------------------------
" -- ---------------------------------------------------
au BufEnter *.h                 setl ft=c
" line widths
au FileType markdown,text,latex setl tw=80
au FileType tex                 setl tw=80
au FileType nasm,c,cpp          setl tw=80
au FileType mail                setl tw=72
au FileType rust                setl tw=80
au FileType python              setl tw=120
au FileType java                setl tw=400
" expand tab by default, but force noet for some..
au FileType markdown            set et
au FileType cmake               setl et
au FileType make                setl noet
au FileType rust                setl noet
au FileType go                  setl noet
au FileType nasm,ld,asm         setl noet
au FileType c,cpp,python        setl noet
" tab is 8 spaces for c, per kernel code style
au FileType rust                setl ts=4
au FileType c,asm,nasm          setl ts=8 | setl shiftwidth=8

" set cindent for c/cpp, this overrides smartindent (si)
au FileType c,cpp               setl cin
" let plaintext be plaintext:
au FileType text,markdown,mail,gitcommit    setl nosi | set noai

" other perks
au BufRead,BufNewFile *.pv      setl ft=proverif
