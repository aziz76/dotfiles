# AGENTS.md - Coding Guidelines for Waybar Configuration

This document provides guidelines for agentic coding assistants working with Waybar configuration files.

## Project Overview

- **Configuration Type**: Waybar (Wayland bar) configuration
- **Files**: `config.jsonc`, `style.css`
- **Language**: JSONC (JSON with comments), CSS
- **Framework**: Waybar (https://github.com/Alexays/Waybar)

## Build, Lint, and Test Commands

Waybar configuration files don't require traditional build processes. However, for validation:

- **Validation**: Use `waybar --validate` to check configuration syntax
- **Reload**: Send SIGHUP signal or use `killall -HUP waybar` to reload configuration
- **Debug**: Run with `waybar -d` for debug output

## Code Style Guidelines

### JSONC Configuration (`config.jsonc`)

1. **Formatting**:
   - Use 2-space indentation
   - Place opening brace on same line as key
   - Add trailing commas for array and object elements
   - Use double quotes for all string values

2. **Structure**:
   - Place modules in logical order (left, center, right sections)
   - Group related modules together
   - Use descriptive names for modules

3. **Comments**:
   - Add explanatory comments for complex configurations
   - Use `//` for single-line comments
   - Place comments above the configuration they explain

### CSS Styling (`style.css`)

1. **Formatting**:
   - Use 2-space indentation
   - Place opening brace on same line as selector
   - Add spaces around operators and after commas
   - Use lowercase hex color codes

2. **Naming Conventions**:
   - Use descriptive class names (e.g., `#battery.critical`, `#clock`)
   - Follow Waybar's built-in class names where applicable
   - Use hyphens for multi-word class names

3. **Properties**:
   - Group related CSS properties together
   - Use shorthand properties where appropriate
   - Define colors in variables for consistency

## Error Handling

1. **Configuration Errors**:
   - Validate with `waybar --validate` before reloading
   - Check logs (`journalctl -u waybar`) for runtime errors
   - Use minimal configuration when debugging

2. **Styling Issues**:
   - Use browser devtools or Waybar's debug mode to inspect elements
   - Test style changes incrementally
   - Use `!important` sparingly and only for debugging

## Tool Definitions (for OpenCode plugins)

Waybar configurations are static files. Tools would focus on:
1. Validation of configuration syntax
2. Reloading/restarting Waybar process
3. Generating configuration snippets
4. Checking for common configuration mistakes

## File Organization

- **`config.jsonc`**: Main Waybar configuration
- **`style.css`**: Styling rules for the bar
- **`modules/` directory**: Optional - separate module configurations

## Documentation

- **JSDoc Comments**: Not applicable for JSON/CSS files
- **Inline Comments**: Use in config.jsonc to explain complex sections
- **README**: Keep updated with setup and usage instructions

## Development Workflow

1. Make changes to configuration files
2. Test with `waybar --validate`
3. Reload with `killall -HUP waybar` or restart Waybar
4. Debug using `waybar -d` if needed

## Environment Configuration

- **Waybar Version**: 0.9.15 or later recommended
- **Wayland Compositor**: Tested with Sway and Hyprland
- **Dependencies**: Waybar package, GTK3

## Troubleshooting

1. **Configuration Not Loading**:
   - Check file permissions
   - Validate syntax with `waybar --validate`
   - Ensure Waybar is installed

2. **Styling Not Applied**:
   - Verify CSS classes match module names
   - Test with simple rules first
   - Check Waybar debug output for errors

3. **Module Not Working**:
   - Verify module is installed
   - Check Waybar logs for error messages
   - Test with minimal configuration