local null_ls = require("null-ls")
local eslint_custom = require("config.null_ls.eslint")
local M = {}

M.setup = function(nvim_lsp, on_attach)
  null_ls.config({
    sources = { 
      null_ls.builtins.formatting.eslint_d.with({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      }),
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.code_actions.gitsigns,
    }
  })

  eslint_custom.setup()

  nvim_lsp["null-ls"].setup({
    on_attach = on_attach
  })

end

return M
