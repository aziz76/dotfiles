return {
  "folke/snacks.nvim",
  keys = {
    {
      "<C-n>",
      function()
        local cwd = vim.fn.expand("%:p:h")
        Snacks.explorer({ cwd = cwd })
      end,
      desc = "Toggle snacks explorer",
    },
  },
  opts = {
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            preview = true,
          },
        },
      },
    },
  },
}
