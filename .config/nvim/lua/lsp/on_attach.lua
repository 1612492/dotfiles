local utils = require("utils")

local on_attach = function(client, buf)
  local opts = { noremap = true, silent = true, buffer = buf }

  vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

  utils.set_key_map("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
  utils.set_key_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  utils.set_key_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  utils.set_key_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  utils.set_key_map("n", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  utils.set_key_map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  utils.set_key_map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  utils.set_key_map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  utils.set_key_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  utils.set_key_map("n", "<leader>a", "<cmd>Lspsaga code_action<cr>", opts)
  utils.set_key_map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end

return on_attach
