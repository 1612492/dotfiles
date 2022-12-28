local utils = require("utils")

local on_attach = function(client, buf)
  local opts = { noremap = true, silent = true, buffer = buf }

  vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

  utils.set_key_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  utils.set_key_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  utils.set_key_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  utils.set_key_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  utils.set_key_map("n", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  utils.set_key_map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({float = {border = 'rounded'}})<cr>", opts)
  utils.set_key_map("n", "]d", "<cmd>lua vim.diagnostic.goto_next({float = {border = 'rounded'}})<cr>", opts)
  utils.set_key_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  utils.set_key_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  utils.set_key_map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  utils.set_key_map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end

return on_attach
