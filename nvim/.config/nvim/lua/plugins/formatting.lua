local function web_formatters(bufnr)
	local global_formatters = { "prettier" }
	local project_formatters = { "oxfmt", "prettier" }
	local root = vim.fs.root(bufnr, { "node_modules" })

	if not root then
		return global_formatters
	end

	local bin = root .. "/node_modules/.bin/"
	for _, formatter in ipairs(project_formatters) do
		if vim.fn.executable(bin .. formatter) == 1 then
			return { formatter }
		end
	end

	return global_formatters
end

require("conform").setup({
	default_format_opts = { lsp_format = "fallback" },
	formatters_by_ft = {
		css = web_formatters,
		go = { "gofumpt" },
		html = web_formatters,
		javascript = web_formatters,
		javascriptreact = web_formatters,
		json = web_formatters,
		lua = { "stylua" },
		rust = { "rustfmt" },
		typescript = web_formatters,
		typescriptreact = web_formatters,
	},
})
