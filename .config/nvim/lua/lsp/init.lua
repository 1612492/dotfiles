return function()
  require("lspconfig.ui.windows").default_options.border = "rounded"

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = false,
    update_in_insert = false,
    underline = false,
  })

  vim.diagnostic.config({ float = { border = "rounded" } })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

  local servers = {
    "astro",
    "cssls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "solidity_ls_nomicfoundation",
    "tailwindcss",
  }

  for _, name in ipairs(servers) do
    require("lsp." .. name)
  end
end
