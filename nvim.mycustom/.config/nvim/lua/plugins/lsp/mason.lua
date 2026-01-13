-- Mason plugin file
-- ~/.config/nvim/lua/abdulaziz/plugins/mason.lua
-- Abdulaziz Al Khater

return {
  {  
  "williamboman/mason-lspconfig.nvim",
  opts = {
    -- List of servers for mason to install
    ensure_installed = {
      "cssls",
      "eslint",
      "html",
      "jsonls",
      "pyright",
      "lua_ls",
      "rust_analyzer"
    }
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        "isort", -- Python formatter
        "black", -- Python formatter
        "pylint",
        "rust_analyzer"
      }
    },
    dependencies = {
      "williamboman/mason.nvim",
    }
  }
}
