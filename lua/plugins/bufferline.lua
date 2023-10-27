local M = {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons'
}

M.config = function()
    require("bufferline").setup({})

end


return M
