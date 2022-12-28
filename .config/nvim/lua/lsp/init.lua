local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
  return
end

require("lspconfig.ui.windows").default_options.border = "rounded"

require("lsp.signs")
require("lsp.handlers")
require("lsp.mason")
require("lsp.server.null_ls")
