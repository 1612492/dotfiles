local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client, buf)
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = buf }

  vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  keymap("n", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({float = {border = 'rounded'}})<cr>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({float = {border = 'rounded'}})<cr>", opts)
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end
local servers = { "cssls", "dartls", "dockerls", "emmet_ls", "html", "jsonls", "null-ls", "tsserver", "volar" }

for _, name in ipairs(servers) do
  require("lsp.servers." .. name)(on_attach, capabilities)
end
