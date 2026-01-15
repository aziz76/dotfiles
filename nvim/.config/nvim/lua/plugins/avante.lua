return {
  "yetone/avante.nvim",
  opts = {
    provider = "lmstudio",
    providers = {
      lmstudio = {
        __inherited_from = "openai",
        api_key_name = "LM_STUDIO_API_KEY",
        endpoint = "http://127.0.0.1:1234/v1",
        model = "nvidia/nemotron-3-nano",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 8192,
        },
      },
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-coder",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 8192,
        },
      },
    },
  },
}
