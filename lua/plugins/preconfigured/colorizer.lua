-- displays color for HEX color code
return {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
}
