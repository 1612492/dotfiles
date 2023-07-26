return function()
  require("lspconfig.ui.windows").default_options.border = "rounded"

  require("lsp.signs")
  require("lsp.handlers")
  require("lsp.servers")
end
