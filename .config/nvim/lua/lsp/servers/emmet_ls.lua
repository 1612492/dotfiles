return function(on_attach, capabilities)
  require("lspconfig").emmet_ls.setup({
    capabilities = capabilities,
    on_attach = function(client, buf)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      on_attach(client, buf)
    end,
  })
end
