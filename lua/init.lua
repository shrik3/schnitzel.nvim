-- plugins... (packer)
-- note that packer is installed from AUR
vim.g.mapleader = ' '
vim.keymap.set('n', '<SPACE>', '<NOP>')
vim.opt.termguicolors = true
require "plugins"
require "scripts"

-- Other Parameters ----------------------------------
-- ---------------------------------------------------
vim.opt.shell = "/usr/bin/fish"
vim.opt.encoding = "utf8"

-- Globals -------------------------------------------
-- ---------------------------------------------------
vim.g.LANG = "en"

-- Themes, Fonts, Colors -----------------------------
-- ---------------------------------------------------
vim.opt.guifont = "Source Code Pro"
if vim.fn.has('nvim')==1 or vim.fn.has('termguicolors') then
    vim.opt.termguicolors = true
end

-- vim.cmd [[
--   syntax on
--   colorscheme tokyonight
--   autocmd! ColorScheme * hi VertSplit cterm=NONE gui=NONE
-- ]]

-- Editor (looks) ------------------------------------
-- ---------------------------------------------------
vim.opt.nu = true
vim.opt.cursorline = true
-- mark column (too wide)
vim.opt.colorcolumn = "96" 
-- status line
vim.opt.laststatus = 2 
-- for git-gutter
vim.opt.signcolumn = "yes" 
-- 7 lines below cursor when moving vertically with j/k
vim.opt.so = 7 
-- always show current position
vim.opt.ruler = true 
-- height command bar
vim.opt.culopt = "number"
vim.opt.cmdheight = 1 
vim.cmd [[
  syntax on
]]

-- Behiviour -----------------------------------------
-- ---------------------------------------------------
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
-- tab
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- linebreak / linewrap
vim.opt.lbr = true
vim.opt.tw = 500
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
vim.keymap.set('n', '<F7>', ':term<CR>')
vim.keymap.set('n', '<F6>', ':ToggleTerm<CR>')
-- nav. panels
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- tag goto
vim.keymap.set('n', '<leader>g', '<C-]>')
-- close buffer
vim.keymap.set('n', '<leader>bk', ':Bclose<CR>',{silent=true})
-- disable highlights (nohl)
vim.keymap.set('n', '<leader><CR>', ':noh<CR>',{silent=true})
-- spell check
vim.keymap.set('n', '<leader>ss', ':setlocal spell!<CR>')
