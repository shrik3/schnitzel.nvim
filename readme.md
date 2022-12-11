This config uses both packer and plugged. The later is used for plugins that
don't work well with packer.


Note that some plugins may require manual setup.

# What is
schnitzel.nvim is my personal IDE-like neovim configuration. 
![preview](https://github.com/shrik3/schnitzel.nvim/blob/master/preview.png)

Please be aware, this is my personal daily drive, opt to my own workflow,
instead of an out-of-the-box set up for everyone. Some of my friends love my
setup so I'm making them public here.

This setup is for those who:
- want a functional "IDE-like", yet blazing fast neovim.
- want a well-structred and -documented config, that you can build your own
  config on top of.
- want to understand what the config is doing.
- hate bloated configs.
- **are willing to go through a little bit of pain** of learning and
  troubleshotting.

If you find my set up hard to use or understand, [neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) 
is a good starting point for you.



# How to set up

## Prerequisites
- make sure you have the newest neovim
- make sure you have [Packer](https://github.com/wbthomason/packer.nvim) and [Plug](https://github.com/junegunn/vim-plug) installed

## Remove or modify my 'personal' settings
There are some settings that are specific to **my own workflow**, remove or
modify them before they cause problems. I keep them in this repo anyways only to
showcase to you how to do some cool stuffs.


**1. Remove wakatime if you don't use it**  
I personally use [wakaTime](https://wakatime.com/vim) as a activity logger. If
you don't use it, remove its config:

in `lua/plugins.lua`
```lua
-- wakatime for statistics, need to initialize token for fresh install
use 'wakatime/vim-wakatime'
```

**2. Other environment related settings**

**Backup your old nvim configs**  
e.g. `~/.config/nvim`

**Download Schnitzel.nvim**
clone this repo and dump everything into your config dir. e.g.
```
git clone https://github.com/shrik3/schnitzel.nvim.git ~/.config/nvim
```

**Launch neovim**:  
there will be tons of errors, don't worry, just ignore them, ignore them, ignore
them.

**Initialize all plugins**  
- install Plug plugins `:PlugInstall`
- install Packer plugins: `:PackerSync` and ':PackerCompile'
- restart neovim

**Don't expect things to work out-of-the-box**  
Some plugins may need manual install, if you encounter errors, follow the info,
locate the error prone plugin, and check their instructions.

# how to customize
First take a look at how the configs are organized in the following section.

**To install a plugin**  
- (recommended) name your plugin in `lua/plugins.lua` and if necessary, put its
  config in `lua/plugin_config/`, then include the config in `lua/plugins.lua`.
  After making changes, restart nvim,  call `:PackerSync` and `PackerCompile`.
- (legacy), using Plug, name your plugin in `legacy/plugins.vim` and its config
  in `legacy/plugin_config/`. Restart neovim and call `PlugInstall`

**To add/delege/modify configs**  
check the following structure to find the best place for your config


# structure

```
.
├── init.vim             -- vim script configs
├── lua                  -- where lua script lives
│   ├── init.lua             -- Lua config base
│   ├── plugin_config        -- Dir for plugin configs
│   ├── plugins.lua          -- Packer managed plugins
│   └── scripts.lua          -- utility scripts
├── legacy               -- where vim script lives
│   ├── plugin_config        -- vimscript plugin configs (Plug)
│   ├── plugins.vim          -- Plug managed plugins
│   └── scripts.vim          -- MISC. Legacy vimscript utils
├── ginit.vim            -- additional configs for gui (e.g. nvim-qt)
├── neovide.vim          -- Additional configs for neovide
├── plugin               -- Packer generated files, don't touch
├── readme.md
├── color                  -- custom themes
└── syntax                 -- Custom syntax highlightings
```

**why 2 set of configs / plugins / managers**  

bear with me, 
- there are some old school plugins that are written in vimscript,
and some of them doesn't work with Packer. 
- lua script is tricky to use for some certain vim configs/ functionalities



# cheatsheet
A handy cheatsheet of key mappings.
```
  __     _____ _    _ _____  _____ _  ______     __
  ||    / ____| |  | |  __ \|_   _| |/ /___ \    ||
  ||   | (___ | |__| | |__) | | | | ' /  __) |   ||
__||__  \___ \|  __  |  _  /  | | |  <  |__ <  __||__
--..--  ____) | |  | | | \ \ _| |_| . \ ___) | --..--
  ||   |_____/|_|  |_|_|  \_\_____|_|\_\____/    ||
                USE VIM OR DIE !
-----------------------------------------------------

|------------ Programming. LSPs.. ---------------------|
\------------------------------------------------------/

K               Hover
gd              Definition (peek)
		  edit = '<C-c>o',
		  vsplit = '<C-c>v',
		  split = '<C-c>i',
		  tabe = '<C-c>t',
		  quit = 'q',	
gD              Declarations
gi              Implementation
go              type def
gr              references
gl              diag. float (under cursor or line)
gL              diag. current buffer
[d , ]d         diag. prev. / next.
C-K             help (manual)
K		Hover Doc..
<leader>o	outline

<F2>            Rename
gr

<F4>            Code Action
<leader>ca	


|------------ Something Fresh. Marks. -----------------|
\------------------------------------------------------/
<leader>m	List all marks
:Marks*		Other available commands
mx              Set mark x
dm<space>       Delete all marks in the current buffer
m,              Set the next available 
		alphabetical (lowercase) mark
m;              Toggle the next available mark at the current line
dmx             Delete mark x
dm-             Delete all marks on the current line
m]              Move to next mark
m[              Move to previous mark
m:              Preview mark. This will prompt you for a specific mark to
	    	preview; press <cr> to preview the next mark.
	    
m[0-9]          Add a bookmark from bookmark group[0-9].
dm[0-9]         Delete all bookmarks from bookmark group[0-9].
m}              Move to the next bookmark having the same type 
		as the bookmark under the cursor. Works across buffers.
m{              Move to the previous bookmark having the same type as 
		the bookmark under the cursor. Works across buffers.
dm=             Delete the bookmark under the cursor.




|------------ Programming.. ---------------------------|
\------------------------------------------------------/

<F3>            :ClangFormat (Plugin)
<leader>c       kToggle Comment (plugin)
<leader>cc
<leader>f       Fuzzy Finder (ACK)

# RUST (rust-tools)
<leader>h       hover_actions
<leader>a       code action group

|------------ Trivias.. -------------------------------|
\------------------------------------------------------/

# F Keys
<F2>            Lsp. Rename
<F3>            Clang Format
<F4>            Lsp. Code Action
<F6>,<C-t>      Split Terminal [plugin]
<F7>            In-buffer Terminal [builtin]
<F8>            Tagbar (show symbols etc) [Plugin]
<F9>            Neotree [plugin]
<F10>           Neotree show buffers

ZQ              quit
:x              = :w
:earlier 5m     go back to 5 minutes ago
                (reverse the file and jump cursor location)

|------------ Misc..... -------------------------------|
\------------------------------------------------------/

:!boxes -d [d]  call boxes, (used with selection, d for
        design, e.g. cat)

|------------ Edit.. ----------------------------------|
\------------------------------------------------------/

>               add indent for multiple lines
>>              add indent for current line
<               remove indent ..
u               undo
<C-R>           redo
vap             select around the paragraph
vi(             etc..
.               repeat last command

D or d$         delete till end of line
C or c$         change till end of line
c               switch to insert mode after d
gg=G            fix indent  (vim built-in)
daw / diw       a for around and i for inside, or dip/dap etc.
di(             to delete in (), di[, di{, di" etc.

<leader>ss      spell check [custom mapping/ plugins]
z=              show possible words
:set tw=[n]     set textwidth

|------------ Nav. Matching.. -------------------------|
\------------------------------------------------------/

e               end of word
$               end of line
^               beginning of line
w               for word
p               for para
%               match parenthesis

|------------ NAV. ------------------------------------|
\------------------------------------------------------/

{ / }           pre. / next paragraph
zz              put current line to center
zt              put current line to top
C-e, C-y        scroll up/down by line
C-u, C-d        scroll up/down by page
<C-g>           show current location (in percentage)
gg / G ,        go to top / Bottom
25%             go to 25 percent of file


|------------ Workspaces. -----------------------------|
\------------------------------------------------------/

<F9>            :NERDTreeToggle (neotree)
:sp :vsp        split
:res [n]        resize
<C-W> c         close split
<C-W> h/j/k/l   nav. splits
<C-h><C-j>      same [custom mappings]
<C-k><C-l>

RESIZE SPLITES:
:vert/hor res +-[n]

|------------ Buffers. --------------------------------|
\------------------------------------------------------/

<leader>bb      show list of buffers  (mapped to neotree)
:ls             showbuffer
:b[n]           switch to buffer [n]
<A-TAB>         :bn    [custom mapping]


|------------ Search / Replace.------------------------|
\------------------------------------------------------/

/ and ?         search forward and backward
R               replace mode
r[x]            replace all characters in selection with x

:s/old/new/g    Replace in line
:%s/old/new/g   Replace all in file
:%s/old/new/gc  Replace all in file, confirm for each

:sort           sort selected lines (by first letter)
```
