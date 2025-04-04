local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font = wezterm.font_with_fallback({
		"Victor Mono",
		{ family = "Symbols Nerd Font Mono", scale = 0.75 },
	}),
	font_size = 14,
	initial_cols = 120,
	initial_rows = 30,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_padding = {
		bottom = 40,
		left = 40,
		right = 40,
		top = 40,
	},
}
