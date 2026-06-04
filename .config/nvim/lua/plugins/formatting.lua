local function web_formatter(bufnr)
	local root = vim.fs.root(bufnr, { "node_modules" })

	if not root then
		return {}
	end

	local bin = root .. "/node_modules/.bin/"
	for _, formatter in ipairs({ "oxfmt", "prettier" }) do
		if vim.fn.executable(bin .. formatter) == 1 then
			return { formatter }
		end
	end

	return {}
end

require("conform").setup({
	default_format_opts = { lsp_format = "fallback" },
	formatters_by_ft = {
		css = web_formatter,
		go = { "gofumpt" },
		html = web_formatter,
		javascript = web_formatter,
		javascriptreact = web_formatter,
		json = web_formatter,
		lua = { "stylua" },
		rust = { "rustfmt" },
		typescript = web_formatter,
		typescriptreact = web_formatter,
	},
})
