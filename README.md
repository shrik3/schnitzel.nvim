Note that some plugins may require manual setup.

# What is

schnitzel.nvim is my personal neovim configuration. 
If you want a cleaner (and much likely better) starting point, checkout the
[starter templetes out there](https://github.com/rockerBOO/awesome-neovim#starter-templates)

This is a minimal yet powerful config. Nevertheless it's very opionionated.

THIS IS NOT a so called "neovim distribution", get NvChard or LunaVim if your
this lazy.


# Prerequisites

- neovim 0.9 + 
- install a [nerd font](https://www.nerdfonts.com/), bear with me I hate it too.
  I'll get rid of this dependency soon.
- install [ctags](https://github.com/universal-ctags/ctags) for plugin tagbar
- install [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope's live
  grep

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

# How to use:
First, check my cheatsheet.txt to get started.

Second, if you like what I offer, fork it for your own and never come back. My
config is not yours, take what you need, need what your take.


# plugins:

take a look at `lua/plugins/init.lua` and you will understand how this works, I
promise.


# structure
- `archived` is for sutffs not in use.
- `init.vim` and `scripts.vim` : some vimscript configs, which are less trivial
  to do in lua.
- `lua/init.lua` the main config.

# License

I don't know if dotfiles need a license. But if you care, consider this public
domain (CC0).

