local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client, buf)
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = buf }

  vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

  keymap({ "n", "v" }, "<leader>a", "<cmd>Lspsaga code_action<cr>", opts)
  keymap("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
  keymap("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
  keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<cr>", opts)
  keymap("n", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  keymap("n", "go", "<cmd>Lspsaga outline<cr>", opts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
end

local servers = {
  "astro",
  "cssls",
  "dockerls",
  "html",
  "jsonls",
  "null-ls",
  "solidity_ls_nomicfoundation",
  "tailwindcss",
}

for _, name in ipairs(servers) do
  require("lsp.servers." .. name)(on_attach, capabilities)
end
