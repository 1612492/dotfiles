local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("neodev").setup({})

require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})
