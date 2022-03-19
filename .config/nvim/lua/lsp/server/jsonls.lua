function extend_options(on_attach, capabilities)
  return {
    capabilities = capabilities,
    on_attach = function(client, buf)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      on_attach(client, buf)
    end,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
  }
end

return extend_options
