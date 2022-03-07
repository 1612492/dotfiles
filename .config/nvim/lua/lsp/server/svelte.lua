local lspconfig = require("lspconfig")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

lspconfig.svelte.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
