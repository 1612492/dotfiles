require("null-ls").config {}
require("lspconfig")["null-ls"].setup {}
require('lspsaga').init_lsp_saga()
require'compe'.setup {
  documentation = {
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  },
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    vsnip = true;
  }
}

-- local base_path = "/Users/phatvo/.config/nvim/"
local lspconfig = require"lspconfig"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup { capabilities = capabilities }
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.jsonls.setup {}
lspconfig.yamlls.setup {}
lspconfig.dockerls.setup {}
lspconfig.svelte.setup {}
lspconfig.tsserver.setup {
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
      -- formatter = "prettier",
      -- formatter_config_fallback = base_path .. ".prettierrc",
    }
    ts_utils.setup_client(client)
  end
}

