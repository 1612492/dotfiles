require("conform").setup({
	default_format_opts = { lsp_format = "fallback" },
	formatters_by_ft = {
		css = { "prettier" },
		go = { "gofumpt" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		lua = { "stylua" },
		rust = { "rustfmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
})
