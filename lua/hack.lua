-- quirks
vim.keymap.set("v", "<C-B>", ":!boxes -d stone <cr>")
vim.keymap.set("v", "<C-S-B>", ":!boxes -d stone -r <cr>")
vim.keymap.set("v", "<leader>b", ":!boxes -d stone -s 80<cr>")
vim.keymap.set("v", "<F1>", ":w !setsid -f espeak -s 150 -D<cr><cr>")
vim.keymap.set("n", "<F1>", ":.w !setsid -f espeak -s 150 -D<cr><cr>")
vim.keymap.set("n", "<F11>", ":.,$w !setsid -f espeak -s 150 -D<cr><cr>")
vim.keymap.set("n", "<F12>", ":!pkill espeak<cr><cr>")
vim.keymap.set("n", "<leader>mm", ":silent!make<cr>")


-- FIXME: this is "bug" from the plugin. The plugin in loads lazily on
-- `BufReadPre`, which means if you simply type nvim it won't load, which means
-- if you put the following mappings in the config it won't setup and you can't
-- use them>...
-- load the session for the current directory
vim.keymap.set("n", "<leader>sl", function() require("persistence").load() end)
-- select a session to load
vim.keymap.set("n", "<leader>sL", function() require("persistence").select() end)
-- load the last session
vim.keymap.set("n", "<leader>ll", function() require("persistence").load({ last = true }) end)
-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>sd", function() require("persistence").stop() end)

