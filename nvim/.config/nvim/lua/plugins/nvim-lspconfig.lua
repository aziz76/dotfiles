return {
  {
    "neovim/nvim-lspconfig",
    --@class PluginLspOpts

    opts = function(_, opts)
      local esp32 = require("esp32")
      opts.servers = opts.servers or {}
      opts.servers.pyright = {}
      opts.servers.clangd = esp32.lsp_config()
      return opts
    end,
  },
}
