local utils = require("utils")
local existed, lspconfig = pcall(require, "lspconfig")

if not existed then
  return
end

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

local handlers = vim.lsp.handlers
handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { underline = false }
)
handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, buf)
  utils.buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  utils.buf_set_key_map(buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  utils.buf_set_key_map(buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  utils.buf_set_key_map(buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  utils.buf_set_key_map(buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  utils.buf_set_key_map(buf, "n", "gf", "<cmd>lua vim.lsp.buf.formatting()<cr>")
  utils.buf_set_key_map(
    buf,
    "n",
    "[d",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>"
  )
  utils.buf_set_key_map(
    buf,
    "n",
    "]d",
    "<cmd>lua vim.diagnostic.goto_next()<CR>"
  )
  utils.buf_set_key_map(buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>")
end

local servers = { "html", "cssls", "jsonls", "yamlls", "dockerls", "svelte", "tailwindcss", "tsserver", "eslint" }

for _, lsp in ipairs(servers) do
  if lsp == "tsserver" then
    lspconfig.tsserver.setup({
      init_options = {
        plugins = { { name = "typescript-styled-plugin" } }
      },
      capabilities = capabilities,
      on_attach = function(client, buf)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, buf)
      end,
    })
  elseif lsp == "eslint" then
    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function(client, buf)
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.document_range_formatting = true
        on_attach(client, buf)
      end,
    })
  elseif lsp == "jsonls" then
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        json = {
          schemas = {
            {
              description = "NPM package.json files",
              fileMatch = { "package.json" },
              url = "https://json.schemastore.org/package.json"
            },
            {
              description = "TypeScript compiler's configuration file",
              fileMatch = { "tsconfig.json" },
              url = "http://json.schemastore.org/tsconfig"
            },
          }
        },
      }
    })
  else
    lspconfig[lsp].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
end
