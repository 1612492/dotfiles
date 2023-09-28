local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").solidity_ls_nomicfoundation.setup({
  capabilities = capabilities,
  single_file_support = true,
})
