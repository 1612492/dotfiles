vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local map = function(key, func)
      local opts = { noremap = true, silent = true, buffer = event.buf }
      vim.keymap.set("n", key, func, opts)
    end

    map("<leader>a", vim.lsp.buf.code_action)
    map("gR", vim.lsp.buf.rename)
    map("gr", require("snacks").picker.lsp_references)
    map("gi", require("snacks").picker.lsp_implementations)
    map("gd", require("snacks").picker.lsp_definitions)
    map("[d", vim.diagnostic.goto_prev)
    map("]d", vim.diagnostic.goto_next)
    map("K", vim.lsp.buf.hover)
  end,
})

vim.diagnostic.config({
  underline = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
