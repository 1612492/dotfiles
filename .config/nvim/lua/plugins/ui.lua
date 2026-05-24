require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	float = { transparent = true },
	term_colors = true,
	integrations = {
		blink_cmp = true,
		diffview = true,
		mason = true,
		nvim_surround = true,
		snacks = true,
	},
})
require("barbar").setup({
	icons = {
		buffer_index = true,
		button = "",
		filetype = { enabled = false },
		separator = { left = "", right = "" },
		modified = { button = "" },
		inactive = { separator = { left = "", right = "" } },
	},
	insert_at_end = true,
	no_name_title = "NO NAME",
})
require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "filename", path = 1 } },
		lualine_c = {
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"filetype",
		},
		lualine_y = { "branch" },
		lualine_z = { "location" },
	},
	extensions = { "quickfix", "oil" },
})
