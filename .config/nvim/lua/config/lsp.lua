local utils = require("utils")

if not utils.is_valid("nvim-lspconfig") then
  return
end

require("null-ls").config {}
require("lspconfig")["null-ls"].setup {}

local lspconfig = require"lspconfig"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local sign_define = vim.fn.sign_define
sign_define("LspDiagnosticsSignError", {text = " "})
sign_define("LspDiagnosticsSignWarning", {text = " "})
sign_define("LspDiagnosticsSignInformation", {text = " "})
sign_define("LspDiagnosticsSignHint", {text = " "})

local handlers = vim.lsp.handlers

handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, { underline = false }
)
handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

lspconfig.html.setup { capabilities = capabilities } 
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.jsonls.setup { capabilities = capabilities }
lspconfig.yamlls.setup { capabilities = capabilities }
lspconfig.dockerls.setup { capabilities = capabilities }
lspconfig.svelte.setup { capabilities = capabilities }
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup {
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint_d",
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = true,
      eslint_show_rule_id = true,
      enable_formatting = true,
      formatter = "eslint_d",
      formatter_config_fallback = nil,
    }
    ts_utils.setup_client(client)
  end
}
