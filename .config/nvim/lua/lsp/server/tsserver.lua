function extend_options(on_attach, capabilities)
  return {
    init_options = {
      plugins = { { name = "typescript-styled-plugin" } },
    },
    capabilities = capabilities,
    on_attach = function(client, buf)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({
        auto_inlay_hints = false,
      })
      ts_utils.setup_client(client)

      on_attach(client, buf)
    end,
  }
end

return extend_options
