local null_ls = require("null-ls")
local M = {}

M.setup = function(lspconfig, on_attach)
  require("config.null_ls.eslint").setup()
  null_ls.config({
    sources = { 
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.diagnostics.eslint_d
    }
  })

  lspconfig["null-ls"].setup({
    on_attach = on_attach
  })

end

return M
