local wezterm = require("wezterm")
local config = {}

config.enable_wayland = false
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Monokai Pro Ristretto (Gogh)"
config.font_size = 18.0

config.window_background_opacity = 0.9
config.text_background_opacity = 0.9

config.enable_tab_bar = false

config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 1,
}
return config
