local utils = require("utils")
local existed, lspconfig = pcall(require, "lspconfig")

if not existed then
  return
end

local null_ls = require("plugin.null_ls")

local sign_define = vim.fn.sign_define
sign_define("LspDiagnosticsSignError", { text = " " })
sign_define("LspDiagnosticsSignWarning", { text = " " })
sign_define("LspDiagnosticsSignInformation", { text = " " })
sign_define("LspDiagnosticsSignHint", { text = " " })

local handlers = vim.lsp.handlers
handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { underline = false }
)
handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client, buf)
  utils.buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  utils.buf_set_key_map(buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  utils.buf_set_key_map(buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  utils.buf_set_key_map(buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  utils.buf_set_key_map(buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  utils.buf_set_key_map(buf, "n", "gf", "<cmd>lua vim.lsp.buf.formatting()<cr>")
  utils.buf_set_key_map(buf, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = 'single' } })<CR>")
  utils.buf_set_key_map(buf, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = 'single' } })<CR>")
  utils.buf_set_key_map(buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")
end

local servers = { "html", "cssls", "jsonls", "yamlls", "dockerls", "svelte", "tsserver" }

null_ls.setup(lspconfig, on_attach)

for _, lsp in ipairs(servers) do
  if lsp == "tsserver" then
    lspconfig.tsserver.setup({
      init_options = { plugins = { { name = "typescript-styled-plugin" } } },
      capabilities = capabilities,
      on_attach = function(client, buf)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, buf)
      end,
    })
  else
    lspconfig[lsp].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
end
