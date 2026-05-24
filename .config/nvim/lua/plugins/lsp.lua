local config = require("plugins.config")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})

vim.lsp.config("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "Snacks", "vim" } },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME, vim.fn.stdpath("config") },
			},
		},
	},
})

vim.lsp.config("tailwindcss", {
	settings = {
		tailwindCSS = { colorDecorators = false },
	},
})

vim.lsp.enable(vim.tbl_values(config.lsps))
