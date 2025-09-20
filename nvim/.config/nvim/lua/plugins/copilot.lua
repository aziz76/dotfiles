return {
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false,
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          markdown = true,
          help = true,
          html = true,
          javascript = true,
          typescript = true,
          ["*"] = true,
        },

        vim.api.nvim_create_autocmd("User", {
          pattern = "BlinkCmpMenuOpen",
          callback = function()
            vim.b.copilot_suggestion_hidden = true
          end,
        }),

        vim.api.nvim_create_autocmd("User", {
          pattern = "BlinkCmpMenuClose",
          callback = function()
            vim.b.copilot_suggestion_hidden = false
          end,
        }),
      }

      vim.keymap.set("i", "<M-Tab>", function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<M;Tab>", true, false, true), "n", false)
        end
      end, {
        silent = true,
      })
    end,
  },
}
