function extend_options(on_attach, capabilities)
  return {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

return extend_options
