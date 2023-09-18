
Note that some plugins may require manual setup.

# NOTE

This config has been reworked to use lazy.nvim.   This readme needs update.


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
- make sure you have [Packer](https://github.com/wbthomason/packer.nvim) and (optionally)[Plug](https://github.com/junegunn/vim-plug) installed
- install a [nerd font](https://www.nerdfonts.com/)
- install [ctags](https://github.com/universal-ctags/ctags) for plugin tagbar

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
- install Packer plugins: `:PackerSync` and `:PackerCompile`, also
  `PackerInstall`
- restart neovim

**Don't expect things to work out-of-the-box**  
Some plugins may need manual install, if you encounter errors, follow the info,
locate the error prone plugin, and check their instructions.

# How to use:
First, check my cheatsheet.txt to get started.

**How to work with Markdown and Latex**  
This setup comes with basic markdown and latex support.

For markdown preview, edit `/lua/plugin_config/vim-markdown-preview`, set your
markdown preview browser by editting e.g. `let g:mkdp_browser = 'firefox'`.
**PRIVACY NOTE!** by default the markdown previewer is open to local network,
i.e. any machine from the same local network can access you being-previewed
document. This is handy if you want to e.g. share document across devices. Make
sure to turn this off if you are in a public network. To do this turn off this
option:
```
let g:mkdp_open_to_the_world = 1
```

To start a markdown preview, type `:MarkdownPreview`.

For latex preview, find the following line in the `/lua/plugins.lua` and set
your previewer:
```
vim.g.livepreview_previewer = 'zathura'
```

To start a preview, type `:LLPStartPreview`

**How to manage projects(session)**  
You can save a session at any time with `:SSave`. If the project already exists
you will be prompted whether to overwrite, otherwise you need to specify a
project name so that a new project can be created. Your saved sessions will be
shown in the startup screen. Check the cheatsheet for more commands.


**How to configure and use LSPs**  
Again, check the cheatsheet for basic LSP commands (e.g. goto def.). Note that
you need to install the language server manually: check [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig#Suggested-configuration).
To add a LSP server, edit `/lua/plugin_config/lspconfig.lua`.


# How to customize
First take a look at how the configs are organized in the following section.

**To install a plugin**  
- (recommended) name your plugin in `lua/plugins.lua` and if necessary, put its
  config in `lua/plugin_config/`, then include the config in `lua/plugins.lua`.
  After making changes, restart nvim,  call `:PackerSync` and `PackerCompile`.
- (legacy), using Plug, name your plugin in `legacy/plugins.vim` and its config
  in `legacy/plugin_config/`. Restart neovim and call `PlugInstall`

**To add/delege/modify configs**  
check the following structure to find the best place for your config

**To change the home (startup) screen**: 
modify `/lua/plugin_config/startify.lua`. you can add your bookmarks here.

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

