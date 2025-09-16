local mason_dap = require "mason-nvim-dap"
local dap = require "dap"
local ui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"

require("mason-nvim-dap").setup {
  ensure_installed = { "codelldb" },
  automatic_installation = { exclude = {} },
}

dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
}

-- Dap Virtual Text
dap_virtual_text.setup()

mason_dap.setup {
  ensure_installed = { "codelldb" },
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
