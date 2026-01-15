# AGENTS.md - Neovim Configuration Guide

This document provides guidelines for agentic coding agents working with this Neovim configuration repository.

## Project Overview

This is a **Neovim configuration** based on **LazyVim**, a modern Neovim configuration framework. The configuration uses Lua and follows LazyVim conventions.

## Build/Lint/Test Commands

### Formatting & Linting
- **Lua formatting**: Uses `stylua` with configuration in `stylua.toml`
- **Shell scripts**: Uses `shellcheck` and `shfmt` (configured via Mason)
- **Python**: Uses `flake8` (configured via Mason)

### Key Commands
Since this is a configuration repository, there are no traditional build/test commands. Instead:

1. **Format Lua files**: `stylua lua/`
2. **Check shell scripts**: `shellcheck scripts/*.sh`
3. **Format shell scripts**: `shfmt -w scripts/*.sh`
4. **Check Python scripts**: `flake8 scripts/*.py`

### Neovim-specific
- **Reload configuration**: `:Lazy sync` or restart Neovim
- **Check health**: `:checkhealth`
- **Update plugins**: `:Lazy update`

## Code Style Guidelines

### General Principles
- Follow **LazyVim conventions** and patterns
- Keep configurations **minimal** and **modular**
- Use **descriptive names** for keymaps and options
- Add **helpful comments** for non-obvious configurations

### Lua Code Style
- **Indentation**: 2 spaces (configured in `stylua.toml`)
- **Line length**: 120 characters maximum
- **Imports**: Use `require()` for module imports
- **Variables**: Use `local` for all variable declarations
- **Functions**: Use descriptive names, prefer arrow functions for callbacks

### File Organization
```
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/          # Core configuration
│   │   ├── options.lua  # Neovim options
│   │   ├── keymaps.lua  # Key mappings
│   │   └── autocmds.lua # Auto commands
│   └── plugins/         # Plugin specifications
│       ├── example.lua  # Example plugin config
│       ├── theme.lua    # Theme configuration
│       └── [plugin].lua # Other plugin configs
└── stylua.toml          # Lua formatter config
```

### Plugin Configuration Patterns

#### Basic Plugin
```lua
return {
  "author/plugin-name",
  -- Optional: version, branch, tag
  version = "*",
  -- Dependencies
  dependencies = { "other/plugin" },
  -- Configuration
  config = function()
    require("plugin").setup({ options })
  end,
  -- Event triggers
  event = "VeryLazy",
  -- Key mappings
  keys = {
    { "<leader>xx", "<cmd>Command<CR>", desc = "Description" }
  }
}
```

#### Overriding LazyVim Defaults
```lua
{
  "LazyVim/LazyVim",
  opts = {
    -- Override default options
    colorscheme = "gruvbox",
  },
}
```

### Keymap Conventions
- Use `vim.keymap.set()` for defining keymaps
- Always include `desc` parameter for documentation
- Follow LazyVim's keymap prefixes:
  - `<leader>`: User-defined leader key (default: space)
  - `<C-...>`: Control combinations
  - `<A-...>`: Alt/Meta combinations

Example:
```lua
local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
```

### Error Handling
- Use `pcall()` for potentially failing operations
- Add validation for user inputs in custom functions
- Log errors using `vim.notify()` with appropriate log level

### Naming Conventions
- **Variables**: `snake_case`
- **Functions**: `snake_case`
- **Constants**: `UPPER_SNAKE_CASE`
- **Plugin config files**: Match plugin name (e.g., `telescope.lua`)

### Comments
- Use `--` for single-line comments
- Use `--[[ ... ]]` for multi-line comments
- Add comments for:
  - Non-obvious configuration choices
  - Workarounds for plugin issues
  - Custom functionality explanations
  - TODO items

### Type Annotations
- Use `---@param` and `---@return` for function documentation
- Add `---@type` annotations for complex tables
- Follow LazyVim's type annotation patterns

Example:
```lua
---@class PluginConfig
---@field enabled boolean
---@field options table

---@param config PluginConfig
---@return boolean
local function setup_plugin(config)
  -- implementation
end
```

## Plugin Management

### Adding New Plugins
1. Create new file in `lua/plugins/` directory
2. Follow plugin configuration patterns
3. Test with `:Lazy sync`
4. Add necessary keymaps to `lua/config/keymaps.lua` if needed

### Modifying Existing Plugins
1. Locate plugin file in `lua/plugins/`
2. Modify configuration while preserving existing patterns
3. Test changes with `:Lazy reload [plugin-name]`

### Troubleshooting
- Check `:Lazy log` for plugin loading issues
- Use `:Lazy debug` for detailed debugging
- Verify Mason installations with `:Mason`

## Development Workflow

1. **Make changes** to configuration files
2. **Format code** with stylua
3. **Reload Neovim** or use `:Lazy sync`
4. **Test functionality** in Neovim
5. **Commit changes** with descriptive messages

## Git Guidelines

- **Commit messages**: Use conventional commits format
- **Branch naming**: `feature/`, `fix/`, `docs/`, `refactor/`
- **PR descriptions**: Include what changed and why

## Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [Neovim Lua Guide](https://github.com/nanotee/nvim-lua-guide)
- [Stylua Configuration](https://github.com/JohnnyMorganz/StyLua)

## Notes for Agents

- This is a **configuration repository**, not a traditional codebase
- Focus on **Neovim/Lua patterns** not general programming patterns
- Preserve **backward compatibility** when modifying configurations
- Test changes **in Neovim** before considering them complete
- Follow **LazyVim community conventions** for plugin configurations