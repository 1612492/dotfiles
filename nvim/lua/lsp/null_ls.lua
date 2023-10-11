local null_ls = require("null-ls")

null_ls.setup({
  border = "rounded",
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.json", ".eslintrc.js" })
      end,
    }),
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = { "astro", "solidity", "svg" },
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/prettier.config.js",
      },
    }),
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" },
    }),
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
  },
})
