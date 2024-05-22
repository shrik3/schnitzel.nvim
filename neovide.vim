let s:guifontsize=10
" let s:guifont="Source\\ Code\\ Pro"
" set guifont=Source\ Code\ Pro:h13

let s:guifont="Fira\\ Mono"
set guifont=Fira\ Mono:h10:l

let g:neovide_refresh_rate=60
let g:neovide_transparency=0.8
let g:neovide_no_idle=v:false
" let g:neovide_fullscreen=v:false
" let g:neovide_cursor_animation_length=0.20
" let g:neovide_cursor_trail_length=0.5
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode = "ripple"
let g:neovide_cursor_vfx_opacity=200.0

" disable the animation
let g:neovide_cursor_animation_length=0
let g:neovide_cursor_trail_length=0

" let g:neovide_cursor_vfx_particle_lifetime=1.2
" let g:neovide_cursor_vfx_particle_density=7.0
" let g:neovide_cursor_vfx_particle_speed=10.0
" let g:neovide_cursor_vfx_particle_phase=1.5
" let g:neovide_cursor_vfx_particle_curl=1.0

" function! AdjustFontSize(amount)
"     let s:guifontsize = s:guifontsize + a:amount
"     execute "set guifont=" .. s:guifont .. ":h" .. s:guifontsize
" endfunction
"
" nnoremap <C-=> <cmd>call AdjustFontSize(+1)<cr>
" nnoremap <C--> <cmd>call AdjustFontSize(-1)<cr>

let g:neovide_scale_factor=1.0
function! ChangeScaleFactor(delta)
  let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-=> ChangeScaleFactor(1.125)
nnoremap <expr><C--> ChangeScaleFactor(1/1.125)

" noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
" noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
