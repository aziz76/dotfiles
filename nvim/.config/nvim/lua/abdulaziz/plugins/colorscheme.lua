-- Color scheme plugin file
-- /.config/nvim/lua/abdulaziz/plugins/colorscheme.lua
-- Abdulaziz Al Khater


return {
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
      vim.cmd([[colorscheme monokai-pro]])
    end,
  },
}
