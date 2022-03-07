local lspconfig = require("lspconfig")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

local init_options = require("nvim-lsp-ts-utils").init_options
init_options.plugins = { { name = "typescript-styled-plugin" } }

lspconfig.tsserver.setup({
  init_options = init_options,
  capabilities = capabilities,
  on_attach = function(client, buf)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({})
    ts_utils.setup_client(client)

    on_attach(client, buf)
  end,
})
