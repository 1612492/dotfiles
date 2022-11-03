local status_ok, mason = pcall(require, "mason")

if not status_ok then
  return
end

mason.setup()

require("mason-lspconfig").setup({
  ensure_installed = { "cssls", "dockerls", "jsonls", "tsserver" },
})

require("mason-null-ls").setup({
  ensure_installed = { "eslint_d", "prettierd", "stylua" },
})

require("lsp.server.cssls")
require("lsp.server.dartls")
require("lsp.server.dockerls")
require("lsp.server.html")
require("lsp.server.jsonls")
require("lsp.server.tsserver")
