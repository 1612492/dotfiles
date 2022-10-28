local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, buf)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({
      auto_inlay_hints = false,
    })
    ts_utils.setup_client(client)

    on_attach(client, buf)
  end,
})
