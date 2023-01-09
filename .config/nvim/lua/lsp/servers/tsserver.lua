return function(on_attach, capabilities)
  require("lspconfig").tsserver.setup({
    init_options = {
      plugins = {
        { name = "typescript-styled-plugin" },
        { name = "typescript-plugin-css-modules" },
      },
    },
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
end
