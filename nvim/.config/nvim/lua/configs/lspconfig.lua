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

-- list of servers configured with default config.

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
