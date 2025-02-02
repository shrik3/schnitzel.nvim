-- ENVs-----------------------------------------------
vim.opt.shell = "/usr/bin/fish"
vim.opt.encoding = "utf8"
vim.g.LANG = "en"
vim.opt.langmenu = "en"

-- setting this ENV "IN_NVIM"
-- if we run a terminal inside of nvim (w. :term), the shell may need to know
-- this fact and behavely differently for me specifically, I use fish, which is
-- configured to use VIM mode, is a pain if you have nested vim mode... lmao
-- example config for fish:
-- ```
-- if set -q IN_NVIM
-- else
--     fish_vi_key_bindings
-- end
-- ```
vim.env.IN_NVIM = 1

-- Important stuffs go first -------------------------
vim.g.mapleader = " "
-- it's important to set leaders first
vim.keymap.set("n", "<SPACE>", "<NOP>")
-- Source other configs ------------------------------
require("lazy_plugins")
require("hack")
-- Accessibility    ----------------------------------
vim.opt.smarttab = false
-- whether to expand tabs depends on the filetype, set them in init.vim
vim.opt.expandtab = true
-- when shiftwidth set to 0, tabstop will always be used
vim.opt.shiftwidth = 0
vim.opt.tabstop = 4
-- set indent on soft-wrapped lines
vim.opt.bri = true

-- Fonts and Colors-----------------------------------
vim.opt.guifont = "fira code"
if vim.fn.has("nvim") == 1 or vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end

vim.cmd([[
    syntax on
    colorscheme dagon
    " no thick borders for splites
    highlight VertSplit guibg=NONE
    highlight VertSplit ctermbg=NONE
    set signcolumn=yes:1
]])

-- UI ------------------------------------------------
-- show numbers (who doesn't?)
vim.opt.nu = true
-- highlight the current row
vim.opt.cursorline = true
-- use block style cursor
vim.opt.guicursor = "n-v-c-i:block"
-- mark column (too wide)
vim.opt.colorcolumn = "96"
-- status line
vim.opt.laststatus = 2
-- 7 lines below/above cursor when scrolling with j/k
vim.opt.so = 7
-- always show current position (on the status line)
vim.opt.ruler = true
-- height command bar
vim.opt.culopt = "both"
-- cmdline and statusline use the same line.
vim.opt.cmdheight = 1
-- don't fold for me..
-- vim.opt.foldenable = false
-- Functions -----------------------------------------
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"
-- command line completion
vim.opt.wildmenu = true
vim.opt.completeopt = "menuone"
-- hide buffer when it's abandoned
-- vim.opt.hid = true
-- configure backspace so it acts as it should do
vim.opt.backspace = "eol,start,indent"
-- h,l,<-,-> could move the cursor to the prev/next line when cursor is
-- on the beginning/end of the line.
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
-- autoindent (ai): copy indent from current line when starting a new line. gq
-- uses indentation of the first line (:help ai)
-- overriding order: indentexpr > cin > smartindent
-- smartindent (si):
-- cindent (cin): is stricter than si. cin will override si when set.
vim.opt.ai = true
vim.opt.si = true
-- linebreak / linewrap
vim.opt.lbr = true
vim.opt.wrap = true
-- text width
vim.opt.tw = 80
-- Search
vim.opt.magic = true -- for regular exp.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- MISC ----------------------------------------------
vim.opt.errorbells = false
vim.opt.visualbell = false
-- Performance
vim.opt.lazyredraw = true
-- vim.opt.updatetime = 4000
-- vim.opt.tm = 500

-- Basic keymaps (independent of plugins) ------------

-- jk on wrapped lines instead of physical lines
vim.cmd([[
noremap j gj
noremap k gk
noremap <A-]> }
noremap <A-[> {
]])

-- nav. panels
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- resize. panels
vim.keymap.set("n", "<C-S-H>", "<C-W><C-H>")

-- use C-s to save, also use :update instead of :w
vim.keymap.set("n", "<C-S>", ":update<cr>")
vim.keymap.set("i", "<C-S>", "<Esc>:update<cr>gi")
vim.keymap.set("n", "zz", ":update<cr>")

-- close buffer the hack is that I don't want to close the window (split) while
-- killing a buffer. Explanation: b# switch to the previous buffer, bd# deletes
-- the buffer that is switched away from.
vim.keymap.set("n", "<leader>bk", ":b#|bd#<CR>", { silent = true })
-- disable highlights (nohl)
vim.keymap.set("n", "<leader><CR>", ":noh<CR>", { silent = true })
-- spell check
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>")
