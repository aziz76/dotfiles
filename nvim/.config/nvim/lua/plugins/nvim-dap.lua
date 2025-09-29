return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap")
    end,
    lazy = false,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-dap-ui" },
  },
}
