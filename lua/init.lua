-- plugins... (packer)
-- note that packer is installed from AUR
--
-- Important stuffs go first -------------------------
-- ---------------------------------------------------
vim.g.mapleader = ' '
vim.keymap.set('n', '<SPACE>', '<NOP>')

-- Load Modules (plugins, Scripts etc.) --------------
-- ---------------------------------------------------
require "lazy_plugins"
require "hack"

-- Accessibility    ----------------------------------
-- ---------------------------------------------------
-- This options works for BIG fonts.
-- jk on wrapped lines instead of physical lines
vim.cmd [[
noremap j gj
noremap k gk
]]

-- Accessibility/tab
vim.opt.smarttab = false
vim.opt.expandtab = true
-- when shiftwidth set to 0, tabstop will always be used
vim.opt.shiftwidth = 0
vim.opt.tabstop = 4

-- set indent on soft-wrapped lines
vim.opt.bri = true

-- Other Parameters ----------------------------------
-- ---------------------------------------------------
vim.opt.shell = "/usr/bin/fish"
vim.opt.encoding = "utf8"

-- Globals -------------------------------------------
-- ---------------------------------------------------
vim.g.LANG = "en"

-- Themes, Fonts, Colors -----------------------------
-- ---------------------------------------------------
vim.opt.guifont = "fira code"
if vim.fn.has('nvim')==1 or vim.fn.has('termguicolors') then
    vim.opt.termguicolors = true
end

vim.cmd [[
    syntax on
    colorscheme alabaster
    " autocmd! ColorScheme * hi VertSplit cterm=NONE gui=NONE
    highlight VertSplit guibg=NONE
    highlight VertSplit ctermbg=NONE
]]

-- Editor (looks) ------------------------------------
-- ---------------------------------------------------
vim.opt.nu = true
vim.opt.cursorline = true
-- mark column (too wide)
vim.opt.colorcolumn = "96"
-- status line
vim.opt.laststatus = 2
-- for git-gutter
-- vim.opt.signcolumn = "yes"
-- 7 lines below cursor when moving vertically with j/k
vim.opt.so = 7
-- always show current position
vim.opt.ruler = true
-- height command bar
vim.opt.culopt = "both"
-- enable cursorline
vim.opt.cmdheight = 1

-- Behiviour -----------------------------------------
-- ---------------------------------------------------
vim.opt.foldenable = false
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"
-- Completion
vim.opt.wildmenu = true
vim.opt.completeopt = "menuone"

-- hide buffer when it's abandoned vim.opt.hid = true
-- configure backspace so it acts as it should do
vim.opt.backspace = "eol,start,indent"
vim.opt.whichwrap = vim.opt.whichwrap + "<,>,h,l"
-- matching brackets
vim.opt.showmatch = true
vim.opt.mat = 2 -- (match)
-- how manny lines of history to remember
vim.opt.history = 500
-- CJK respect line wrap and tw
vim.opt.formatoptions = vim.opt.formatoptions + "mM"
-- auto read when a file is changed from outside
vim.opt.autoread = true
-- turn off backup
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false
-- auto/smart indent
vim.opt.ai = true
vim.opt.si = true
-- linebreak / linewrap
vim.opt.lbr = true
vim.opt.tw = 200
vim.opt.wrap = true
-- Search
vim.opt.magic = true -- for regular exp.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- turn off sound
vim.opt.errorbells = false
vim.opt.visualbell = false
-- MISC.
vim.opt.langmenu="en"

-- Performance ---------------------------------------
-- ---------------------------------------------------
vim.opt.lazyredraw = true
vim.opt.updatetime = 100
vim.opt.tm = 500

-- KeyMaps -------------------------------------------
-- ---------------------------------------------------
-- for paragraph nav.
-- with Right-Alt, this can be done comfortably 
-- with right hand.
vim.cmd [[
noremap <A-]> }
noremap <A-[> {
]]


-- nav. panels
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- use C-s to save, also use :update instead of :w
vim.keymap.set('n','<C-S>',':update<cr>')
vim.keymap.set('i','<C-S>','<Esc>:update<cr>gi')
vim.keymap.set('n','zz',':update<cr>')

-- close buffer
vim.keymap.set('n', '<leader>bk', ':Bclose<CR>',{silent=true})
-- disable highlights (nohl)
vim.keymap.set('n', '<leader><CR>', ':noh<CR>',{silent=true})
-- spell check
vim.keymap.set('n', '<leader>ss', ':setlocal spell!<CR>')
