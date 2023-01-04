function config()
  require("lspconfig.ui.windows").default_options.border = "rounded"

  require("lsp.signs")
  require("lsp.handlers")
  require("lsp.server.cssls")
  require("lsp.server.dartls")
  require("lsp.server.dockerls")
  require("lsp.server.html")
  require("lsp.server.jsonls")
  require("lsp.server.null-ls")
  require("lsp.server.tsserver")
  require("lsp.server.volar")
end

return config
