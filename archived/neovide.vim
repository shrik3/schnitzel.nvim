let s:guifontsize=10
let s:guifont="Fira\\ Mono"
set guifont=Fira\ Mono:h10:l
let g:neovide_refresh_rate=60
let g:neovide_transparency=0.8
let g:neovide_no_idle=v:false
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode = "ripple"
let g:neovide_cursor_vfx_opacity=200.0
let g:neovide_cursor_animation_length=0
let g:neovide_cursor_trail_length=0
let g:neovide_scale_factor=1.0
function! ChangeScaleFactor(delta)
  let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-=> ChangeScaleFactor(1.125)
nnoremap <expr><C--> ChangeScaleFactor(1/1.125)
