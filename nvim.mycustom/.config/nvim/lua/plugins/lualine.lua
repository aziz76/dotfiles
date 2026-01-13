-- Lualine plugin file
-- ~/.config/nvim/lua/abdulaziz/plugins/lualine.lua
-- Abdulaziz Al Khater

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup()
    end,
}
