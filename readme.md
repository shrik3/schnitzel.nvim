This config uses both packer and plugged. The later is used for plugins that
don't work well with packer.

```
.
├── colors                     << my colorscheme of choice
│   └── tomorrow-night-blue.vim 
├── custom_scripts.vim         << other vimscripts that I use
├── deoplete_conf.vim          << config for plugin deoplete
├── ginit.vim                  << specs for gui (e.g. nvim-qt)
├── init.vim                   << "legacy" vimscript config
├── lightline_conf.vim         << config for plugin lightline
├── lua
│   ├── init.lua               << main config
│   ├── lsp.lua                << LSP settings (nvim-lspconfig)
│   ├── plugin_settings.lua    << settings (for Packer managed plugins)
│   └── plugins.lua            << main plugin config (managed by Packer)
├── neovide.vim                << Specs. for neovide
├── plugin                     << Packer generated
│   └── packer_compiled.lua 
├── plugins.vim                << "legacy" plugins, managed by Plugged
├── readme.md
├── syntax                     << temporary highlighting (just ignore this)
│   └── proverif.vim
└── vim-rtags-mappings.vim     << vim-rtags plugin config
                                  can be replaced by lsp .. 
                                  I used this before to do c/c++ completion
```

Note that some plugins may require manual setup.
