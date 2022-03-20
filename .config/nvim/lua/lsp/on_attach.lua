local utils = require("utils")

local on_attach = function(client, buf)
  utils.buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  utils.buf_set_key_map(buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  utils.buf_set_key_map(buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  utils.buf_set_key_map(buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  utils.buf_set_key_map(buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  utils.buf_set_key_map(buf, "n", "gf", "<cmd>lua vim.lsp.buf.formatting()<cr>")
  utils.buf_set_key_map(buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  utils.buf_set_key_map(buf, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({float = {border = 'rounded'}})<cr>")
  utils.buf_set_key_map(buf, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({float = {border = 'rounded'}})<cr>")
  utils.buf_set_key_map(buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  utils.buf_set_key_map(buf, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  utils.buf_set_key_map(buf, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>")
end

return on_attach
