-- quirks
vim.keymap.set('v', '<C-B>', ':!boxes -d stone <cr>')
vim.keymap.set('v', '<C-S-B>', ':!boxes -d stone -r <cr>')
vim.keymap.set('v', '<leader>b', ':!boxes -d stone -s 80<cr>')
vim.keymap.set('v', '<F1>', ':w !setsid -f espeak -s 150 -D<cr><cr>')
vim.keymap.set('n', '<F1>', ':.w !setsid -f espeak -s 150 -D<cr><cr>')
vim.keymap.set('n', '<F11>', ':.,$w !setsid -f espeak -s 150 -D<cr><cr>')
vim.keymap.set('n', '<F12>', ':!pkill espeak<cr><cr>')
vim.keymap.set('i', '<C-CR>', '<Esc>:.w !setsid -f espeak<CR>o')
