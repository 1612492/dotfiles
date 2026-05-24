vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { noremap = true, silent = true, buffer = event.buf }

		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok_add = pcall(vim.treesitter.language.add, lang)
		if not ok_add then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
	end,
})
