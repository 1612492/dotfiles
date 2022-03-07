local existed, _ = pcall(require, "lspconfig")

if not existed then
  return
end

require("lsp.signs")
require("lsp.handlers")

-- Server configuration
require("lsp.server.cssls")
require("lsp.server.dockerls")
require("lsp.server.emmet_ls")
require("lsp.server.gopls")
require("lsp.server.html")
require("lsp.server.jsonls")
require("lsp.server.null_ls")
require("lsp.server.svelte")
require("lsp.server.tsserver")
require("lsp.server.yamlls")
