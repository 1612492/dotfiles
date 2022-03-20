local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

function extend_options(on_attach, capabilities)
  return {
    capabilities = capabilities,
    on_attach = function(client, buf)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      on_attach(client, buf)
    end,
  }
end

return extend_options