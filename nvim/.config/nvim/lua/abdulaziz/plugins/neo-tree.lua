return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  opts = {
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          -- auto close
          require("neo-tree.command").execute({ action = "close" })
        end,
      }
    }
  }
}
