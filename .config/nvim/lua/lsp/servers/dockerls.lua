return function(on_attach, capabilities)
  require("lspconfig").dockerls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
