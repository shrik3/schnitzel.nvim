This config uses both packer and plugged. The later is used for plugins that
don't work well with packer.

```
.
├── init.vim             -- vim script configs
├── lua                  -- where lua script lives
│   ├── init.lua             -- Lua config base
│   ├── plugin_config        -- Dir for plugin configs
│   ├── plugins.lua          -- Packer managed plugins
│   └── scripts.lua          -- utility scripts
├── legacy               -- where vim script lives
│   ├── plugin_config        -- vimscript plugin configs (Plugged)
│   ├── plugins.vim          -- Plugged managed plugins
│   └── scripts.vim          -- MISC. Legacy vimscript utils
├── ginit.vim            -- additional configs for gui (e.g. nvim-qt)
├── neovide.vim          -- Additional configs for neovide
├── plugin               -- Packer generated files, don't touch
├── readme.md
├── color                  -- custom themes
└── syntax                 -- Custom syntax highlightings
```

Note that some plugins may require manual setup.
