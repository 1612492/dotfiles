function extend_options(on_attach, capabilities)
  return {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      solidity = {
        packageDefaultDependenciesContractsDirectory = "",
        packageDefaultDependenciesDirectory = "node_modules",
      },
    },
  }
end

return extend_options
