local icon = require("icon")

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

  vim.fn.sign_define("DiagnosticSignError", { text = icon.error, texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = icon.warn, texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = icon.info, texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = icon.hint, texthl = "DiagnosticSignHint" })

  local servers = {
    "astro",
    "cssls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "null_ls",
    "rust_analyzer",
    "solidity_ls_nomicfoundation",
    "svelte",
    "tailwindcss",
  }

  for _, name in ipairs(servers) do
    require("lsp." .. name)
  end
end
