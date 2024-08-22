**Branches**  
- `master`: without my very personal perks. A little bit more "stable"
- `my-own`: exactly what I daily drive, synchonized to my own config.

# IMPORTANT

This is NOT a "neovim distribution". Spontaneous and breaking changes are often
introduced. If you use this config, **fork it, make it your own and never look
back**.

# What is
schnitzel.nvim is my personal neovim configuration. 

**why**  
- it's minimal
- it's a basic collection of plugins and configs that works out-of-the box for
  most use cases
- lua as first-class citizen but there's also room for the old good vimscript

**other resources**
- As always, read the friend manuals. Also the `:help <something>` command has
  good coverage.
- Run the vim tutor if you are an absolute beginner. The `vimtutor` program
  is ususally installed together with vim. In neovim you can also call `:Tutor`.
- rockerBOO's [awesome-neovim](https://github.com/rockerBOO/awesome-neovim#starter-templates)
    is a great collection of plugins and other useful stuffs.
- If you want to build a configuration of you own, take a look at the 
    [starter templetes](https://github.com/rockerBOO/awesome-neovim#starter-templates)
    in the awesome-neovim repo

# Prerequisites
- neovim 0.9 + 
- install a [nerd font](https://www.nerdfonts.com/) 
- install [ctags](https://github.com/universal-ctags/ctags) for plugin tagbar
- install [ripgrep](https://github.com/BurntSushi/ripgrep)

# Get started
**Backup your old nvim configs**  
e.g. `~/.config/nvim`

**Download Schnitzel.nvim**
clone this repo and dump everything into your config dir. e.g.
```
git clone https://github.com/shrik3/schnitzel.nvim.git ~/.config/nvim
```

**Launch neovim and sync the plugins**:  
and let Lazy.nvim handle the plugins initialization for the first time. Then
**restart neovim**. Should you run into troubles, try `:checkhealth lazy`. To
update the plugins use `:Lazy sync`

# How to use - Perks:
First, check my cheatsheet.txt to get started.

**How to configure and use LSPs**  
Again, check the cheatsheet for basic LSP commands (e.g. goto def.). Note that
you need to install the language server manually:
check [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig#Suggested-configuration).
To add a LSP server, edit `/lua/plugin_config/lspconfig.lua`.

**How to work with Markdown and Latex**  
This setup comes with basic markdown and latex support.


# How to customize
First take a look at how the configs are organized in the following section.

**To install a new plugin**:  
For plugins that requires only a few or no configs, you can add a line in
`lua/plugins/init.lua`.  Otherwise it's recomennded to split the config into a
separate file: use `lua/plugins/template.txt` as a template. Lazy.nvim will
automacally scan the `plugins` folder and load the config files in it.


# structure

```
.
├── cheatsheet.txt
├── ginit.vim               -- configs for gui vim such as nvim-qt
├── neovide.vim             -- configs for neovide
├── init.vim                -- entry point of the config, for vimscript config
├── legacy                  
│   ├── archived            -- stuffs that are no longer used
│   │   ├── ...
│   │   └── ...
│   └── scripts.vim         -- old vimscript utility scripts
├── lua
│   ├── init.lua            -- Entry point of lua config
│   ├── lazy_plugins.lua    -- For lazy.nvim. You don't need to modify
│   └── plugins             -- Dir for plugin configs
│       ├── init.lua        -- where most of the simple plugins are named
│       ├── ....lua         -- more complicated plugin configs in separate files
│       └── template.txt    -- Use this as a template to add new plugin
├── preview.png
├── readme.md
├── LICENSE
└── syntax                  -- Some of my custome syntax defs.
```

# License

I don't know if dotfiles need a license. But if you care, consider this public
domain (CC0).


# Notes

For markdown preview, take a look at `/lua/plugin_config/markdown`. To start a
markdown preview, type `:MarkdownPreview`.

Notably this option can be dangerous:
```
let g:mkdp_open_to_the_world = 1
```
