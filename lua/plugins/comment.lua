
local M = {
    'numToStr/Comment.nvim',
}

M.config = function()
    require('Comment').setup({
        toggler = {
            line = '<leader>cc',
            block = '<leader>cb',
        },

        opleader = {
            ---Line-comment keymap
            line = '<Leader>cc',
            block = '<leader>cb',
        },
        extra = {
            ---Add comment on the line above
            above = '<Leader>cO',
            ---Add comment on the line below
            below = '<Leader>co',
            ---Add comment at the end of line
            eol = '<Leader>cA',
        }

    })
end

return M
