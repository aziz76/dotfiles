return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
    "milanglacier/minuet-ai.nvim",
  },
  opts = {
    completion = {
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
        },
      },
    },
    sources = {
      default = { "avante", "minuet", "lsp", "path", "snippets", "buffer" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {},
        },
        minuet = {
          name = "minuet",
          module = "minuet.blink",
          score_offset = 100,
        },
      },
    },
  },
}
