local existed, _ = pcall(require, "lspconfig")

if not existed then
  return
end

require("lsp.signs")
require("lsp.installer")
require("lsp.server.null_ls")
