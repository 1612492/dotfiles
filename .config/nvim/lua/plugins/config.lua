local M = {}

M.lsps = {
	["css-lsp"] = "cssls",
	["html-lsp"] = "html",
	["json-lsp"] = "jsonls",
	["lua-language-server"] = "lua_ls",
	["rust-analyzer"] = "rust_analyzer",
	["tailwindcss-language-server"] = "tailwindcss",
	["vscode-solidity-server"] = "solidity_ls",
	gopls = "gopls",
	tsgo = "tsgo",
}

M.formatters = {
	"prettier",
	"stylua",
	"gofumpt",
}

M.treesitter_parsers = {
	"css",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"tsx",
	"typescript",
}

return M
