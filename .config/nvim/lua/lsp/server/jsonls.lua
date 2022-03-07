local lspconfig = require("lspconfig")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = {
        {
          description = "NPM package.json files",
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          description = "TypeScript compiler's configuration file",
          fileMatch = { "tsconfig.json" },
          url = "http://json.schemastore.org/tsconfig",
        },
      },
    },
  },
})
