local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

require("lspconfig").dartls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
