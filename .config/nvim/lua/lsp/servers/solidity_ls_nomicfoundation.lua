return function(on_attach, capabilities)
  require("lspconfig").solidity_ls_nomicfoundation.setup({
    capabilities = capabilities,
    single_file_support = true,
    on_attach = function(client, buf)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      on_attach(client, buf)
    end,
  })
end
