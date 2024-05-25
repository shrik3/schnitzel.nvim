let s:fontsize = 12
let s:minsize = 6
let s:maxsize = 15

function! AdjustFontSize(amount)
  let s:newsize = s:fontsize + a:amount
  if(s:newsize>s:minsize && s:newsize<s:maxsize)
      let s:fontsize = s:newsize
      :execute "GuiFont! Source Code Pro:h" . s:fontsize .":l"
  endif
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
