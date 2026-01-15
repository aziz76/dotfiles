# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration. LazyVim provides sensible defaults and a plugin management framework; custom configurations extend or override these defaults.

## Architecture

```
lua/
├── config/           # Core configuration (loads after LazyVim)
│   ├── lazy.lua      # Plugin manager bootstrap and setup
│   ├── options.lua   # Editor options
│   ├── keymaps.lua   # Custom keybindings
│   └── autocmds.lua  # Autocommands
└── plugins/          # Plugin specifications (each file returns a lazy.nvim spec)
```

**Entry flow:** `init.lua` → `config/lazy.lua` → LazyVim base → `plugins/*.lua`

## Key Commands (in Neovim)

- `:Lazy` - Plugin manager (install, update, clean, sync)
- `:Mason` - LSP/formatter/linter installer
- `:LazyExtras` - Enable/disable LazyVim extras

## Adding Plugins

Create a new file in `lua/plugins/` returning a lazy.nvim plugin spec:

```lua
return {
  "author/plugin-name",
  opts = {
    -- configuration
  },
}
```

## Active Configuration

- **Theme:** Gruvbox
- **AI Assistant:** Avante with DeepSeek backend (requires `DEEPSEEK_API_KEY` env var)
- **File Explorer:** Snacks.nvim (`<C-n>` to toggle)
- **Navigation:** vim-tmux-navigator for seamless Tmux pane switching
- **Debugger:** DAP keymaps configured in `config/keymaps.lua`

## LazyVim Extras Enabled

From `lazyvim.json`: Avante, Copilot, CMake, Rust

## Code Formatting

Lua files use stylua with 2-space indentation and 120-column width (see `stylua.toml`).
