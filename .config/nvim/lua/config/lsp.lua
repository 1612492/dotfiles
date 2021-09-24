local utils = require("utils")
local existed, lspconfig = pcall(require, "lspconfig")

if not existed then
  return
end

require("config.lspsaga")
local null_ls = require("config.null_ls")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client, buf)
  utils.buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  utils.buf_set_key_map(buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  utils.buf_set_key_map(buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  utils.buf_set_key_map(buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  utils.buf_set_key_map(buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  utils.buf_set_key_map(buf, "n", "gf", "<cmd>lua vim.lsp.buf.formatting()<cr>")
  utils.buf_set_key_map(buf, "n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<cr>")
  utils.buf_set_key_map(buf, "n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>a", "<cmd>lua require('lspsaga.codeaction').code_action()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")
end

local servers = { "html", "cssls", "jsonls", "yamlls", "dockerls", "svelte", "tsserver" }

null_ls.setup(lspconfig, on_attach)

for _, lsp in ipairs(servers) do
  if lsp == "tsserver" then
    lspconfig.tsserver.setup({
      init_options = { plugins = {{name = "typescript-styled-plugin"}}},
      capabilities = capabilities,
      on_attach = function(client, buf)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, buf)
      end
    })
  else
    lspconfig[lsp].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
end
