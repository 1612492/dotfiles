local nls = require("null-ls")

return function(on_attach, capabilities)
  nls.setup({
    border = "rounded",
    sources = {
      nls.builtins.formatting.prettierd.with({
        extra_filetypes = { "astro", "solidity", "svg" },
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/prettier.config.js",
        },
      }),
      nls.builtins.formatting.stylua.with({
        extra_args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" },
      }),
    },
    on_attach = on_attach,
  })
end
