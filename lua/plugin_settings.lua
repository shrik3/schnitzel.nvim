-- require('mini.starter').setup()


require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<c-\>]],
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'horizontal',
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
--
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local Path = require('plenary.path')
require('session_manager').setup({
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), 
    -- The directory where the session files will be saved.
    path_replacer = '__', 
    -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++', 
    -- The character to which the colon symbol will be replaced for session files.
    autoload_mode = require('session_manager.config').AutoloadMode.Disabled, 
    -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autosave_last_session = true, 
    -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true, 
    -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_dirs = {}, 
    -- A list of directories where the session will not be autosaved.
    autosave_ignore_filetypes = { 
        -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
    },
    autosave_ignore_buftypes = {}, 
    -- All buffers of these bufer types will be closed before the session is saved.
    autosave_only_in_session = false, 
    -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80,  
    -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})
