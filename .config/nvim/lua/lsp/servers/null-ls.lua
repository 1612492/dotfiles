local nls = require("null-ls")

return function(on_attach, capabilities)
  nls.setup({
    sources = {
      nls.builtins.code_actions.eslint_d,
      nls.builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.json", ".eslintrc.js" })
        end,
      }),
      nls.builtins.formatting.prettierd.with({
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/.prettierrc.json",
        },
      }),
      nls.builtins.formatting.stylua.with({
        extra_args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" },
      }),
    },
    on_attach = on_attach,
    debug = false,
  })
end
