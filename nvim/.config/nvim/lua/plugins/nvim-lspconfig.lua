return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        clangd = {},
      },
      -- Configure floating window behavior
      setup = {
        ["*"] = function()
          -- Configure hover popup
          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            -- Anchor position: 'NW', 'NE', 'SW', 'SE' for corners
            -- or leave unset for default auto-positioning
            anchor = "NW",
            -- Offset from cursor: {row, col}
            -- Positive row = below cursor, negative = above
            -- Positive col = right of cursor, negative = left
            offset_x = 1,
            offset_y = 1,
            -- Max dimensions
            max_width = 80,
            max_height = 20,
          })

          -- Configure signature help popup
          vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
            anchor = "NW",
            offset_x = 1,
            offset_y = 1,
            max_width = 80,
            max_height = 20,
          })
        end,
      },
    },
  },
}
