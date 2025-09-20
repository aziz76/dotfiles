require("nvchad.configs.lspconfig").defaults()

local default_servers = {
  "lua_ls",
  "html",
  "cssls",
  "clangd",
}
vim.lsp.enable(default_servers)

-- read :h vim.lsp.config for changing options of lsp servers

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
  "html",
  "cssls",
  "clangd",
}

vim.lsp.servers.clangd = {
  opts = function(_, opts)
    local esp32 = require "esp32"
    opts.servers = opts.servers or {}
    opts.servers.clangd = esp32.lsp_config()
    return opts
  end,
}
-- list of servers configured with default config.

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  vim.lsp.config(lsp, { on_attach = on_attach }) -- These changes answer the breaking changes to lspconfig
  vim.lsp.config(lsp, { on_init = on_init }) -- following the update.
  vim.lsp.config(lsp, { capabilities = capabilities })
  --   lspconfig[lsp].setup {
  --     on_attach = on_attach,
  --     on_init = on_init,
  --     capabilities = capabilities,
  --  }
end
