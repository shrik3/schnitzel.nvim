This config uses both packer and plugged. The later is used for plugins that
don't work well with packer.

```
.
├── colors                     << my colorscheme of choice
│   └── tomorrow-night-blue.vim 
├── custom_scripts.vim         << other vimscripts that I use
├── deoplete_conf.vim          << config fore deoplete
├── ginit.vim                  << specs for gui (e.g. nvim-qt)
├── init.vim
├── lightline_conf.vim
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
├── syntax                     << temporary highlighting
│   └── proverif.vim
└── vim-rtags-mappings.vim
```

Note that some plugins may require manual setup.
