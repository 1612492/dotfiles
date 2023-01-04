local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

require("lspconfig").jsonls.setup({
  capabilities = capabilities,
  on_attach = function(client, buf)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, buf)
  end,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})
