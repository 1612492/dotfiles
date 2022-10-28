local null_ls = require("null-ls")
local on_attach = require("lsp.on_attach")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" },
    }),
  },
  on_attach = on_attach,
  debug = false,
})
