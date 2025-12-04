-- Disable Mason auto-installation for clangd since we use ESP32 version
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Add other tools you want Mason to install, but NOT clangd
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- Ensure Mason doesn't try to manage clangd
      handlers = {
        clangd = function() end, -- Don't let Mason set up clangd
      },
    },
  },
}
