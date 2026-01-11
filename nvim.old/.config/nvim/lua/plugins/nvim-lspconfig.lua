return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local esp32 = require("esp32")
      opts.servers = opts.servers or {}
      opts.servers.clangd = esp32.lsp_config()
      return opts
    end,
  },
  --{
  --  "neovim/nvim-lspconfig",
  --  opts = function(_, opts)
  --    opts.servers = opts.servers or {}
  --    opts.servers.pyright = {}
  --    return opts
  --  end,
  --},
}
