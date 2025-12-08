return {
  "Aietes/esp32.nvim",
  opts = {
    build_dir = "build",  -- CMake build directory for compile_commands.json
  },
  dependencies = {
    "folke/snacks.nvim",  -- Required for terminal and picker interfaces
  },
}
