-- autopairs plugin file
-- /.config/nvim/lua/abdulaziz/plugins/autopairs.lua
-- Abdulaziz Al Khater

return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt", "vim" },
        })
    end,
}
