local utils = require("utils")

if not utils.is_valid("nvim-lspconfig") then
  return
end

require("null-ls").config {}

local nvim_lsp = require"lspconfig"
nvim_lsp["null-ls"].setup {}

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, buf)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(buf, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(buf, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = 'single' } })<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = 'single' } })<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

local servers = { "html", "cssls", "jsonls", "yamlls", "dockerls", "svelte", "tsserver" }

for _, lsp in ipairs(servers) do
  if lsp == 'tsserver' then
    nvim_lsp.tsserver.setup {
      init_options = { plugins = {{name = "typescript-styled-plugin"}}},
      capabilities = capabilities,
      on_attach = function(client, buf)
        on_attach(client, buf)
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
  else
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end
end
