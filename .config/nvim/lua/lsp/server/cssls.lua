local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  on_attach = function(client, buf)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, buf)
  end,
})
