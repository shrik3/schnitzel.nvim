Note that some plugins may require manual setup.

# NOTE
The config has switched to lazy.nvim (previously using packer.nvim). The old
packer-based config can still be found in the master branch but will no longer
be maintained.


# What is
schnitzel.nvim is my personal neovim configuration. 
![preview](https://github.com/shrik3/schnitzel.nvim/blob/lazy/preview.png)

**Should I use it?**  
probably not, because this is optimized to my own preference and workflow.

If you want a cleaner (and much likely better) starting point, checkout the
[starter templetes out there](https://github.com/rockerBOO/awesome-neovim#starter-templates)

**What's it good for**  
- it's minimal
- it's a basic collection of plugins and configs that works out-of-the box for
  most use cases
- lua as first-class citizen but there's also room for the old good vimscript


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
**restart neovim**. Should you run into troubles, try `:checkhealth lazy`.

# How to use:
First, check my cheatsheet.txt to get started.

**How to work with Markdown and Latex**  
This setup comes with basic markdown and latex support.

For markdown preview, edit `/lua/plugin_config/markdown`, set your
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

# How to customize
First take a look at how the configs are organized in the following section.

**To install a neo plugin**:  
For plugins that requires only a few or no configs, you can add a line in
`lua/plugins/init.lua`.  Otherwise it's recomennded to split the config into a
separate file: use `lua/plugins/template.txt` as a template. Lazy.nvim will
automacally scan the `plugins` folder and load the config files in it.

**To change the home (startup) screen**: 
modify `/lua/plugins/startify.lua`. you can add your bookmarks here.

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

7 directories, 31 files

```

# License

I don't know if dotfiles need a license. But if you care, consider this public
domain.
