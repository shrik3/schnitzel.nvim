**Branches**  
- `master`: without my very personal perks. A little bit more "stable"
- `my-own`: exactly what I daily drive, synchonized to my own config.

# IMPORTANT

This is NOT a "neovim distribution". Spontaneous and breaking changes are often
introduced. If you use this config, **fork it, make it your own and never look
back**.

# What is

schnitzel.nvim is my personal neovim configuration. 

This is a minimal yet powerful config. Nevertheless it's very opionionated.

# other resources**
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

# How to use

check my cheatsheet.txt to get started.


# plugins:

take a look at `lua/plugins/init.lua` and you will understand how this works, I
promise.


# structur

- `archived` is for sutffs not in use.
- `init.vim` and `scripts.vim` : some vimscript configs, which are less trivial
  to do in lua.
- `lua/init.lua` the main config.

# License

I don't know if dotfiles need a license. But if you care, consider this public
domain (CC0).
