local status_ok, mason = pcall(require, "mason")

if not status_ok then
  return
end

local icons = require("icons")

mason.setup({
  ui = {
    icons = {
      package_installed = icons.Success,
      package_uninstalled = icons.Failure,
      package_pending = icons.Pending,
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = { "cssls", "dockerls", "html", "jsonls", "tsserver", "volar" },
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
require("lsp.server.volar")
