return {
  "folke/snacks.nvim",
  keys = {
    {
      "<C-n>",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
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
