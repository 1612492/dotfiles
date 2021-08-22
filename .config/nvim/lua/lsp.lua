require("null-ls").config {}
require("lspconfig")["null-ls"].setup {}
require('lspsaga').init_lsp_saga()

vim.g.coq_settings = {
  auto_start = "shut-up",
  clients = {
    tmux = { enabled = false },
    tree_sitter = { enabled = false },
    tags = { enabled = false }
  },
  keymap = {
    recommended = false,
    jump_to_mark = "<c-j>"
  }
}

local lspconfig = require"lspconfig"
local coq = require "coq"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup(coq.lsp_ensure_capabilities({ capabilities = capabilities }))
lspconfig.cssls.setup(coq.lsp_ensure_capabilities({ capabilities = capabilities }))
lspconfig.jsonls.setup(coq.lsp_ensure_capabilities({}))
lspconfig.yamlls.setup(coq.lsp_ensure_capabilities({})) 
lspconfig.dockerls.setup(coq.lsp_ensure_capabilities({})) 
lspconfig.svelte.setup(coq.lsp_ensure_capabilities({})) 
lspconfig.tsserver.setup (coq.lsp_ensure_capabilities({
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
})) 
