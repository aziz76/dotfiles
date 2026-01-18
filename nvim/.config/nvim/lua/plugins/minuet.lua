return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    provider = "openai_compatible",
    provider_options = {
      openai_compatible = {
        api_key = "DEEPSEEK_API_KEY",
        end_point = "https://api.deepseek.com/v1/chat/completions",
        model = "deepseek-coder",
        name = "DeepSeek",
        optional = {
          max_tokens = 256,
          temperature = 0.7,
        },
      },
    },
  },
}
