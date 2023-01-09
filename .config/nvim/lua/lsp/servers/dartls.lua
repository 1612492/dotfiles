return function(on_attach, capabilities)
  require("lspconfig").dartls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
