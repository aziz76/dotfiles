-- Colorizer plugin file
-- /.config/nvim/lua/abdulaziz/plugins/colorizer.lua
-- Abdulaziz Al Khater

return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({ "*" })
    end,
}

