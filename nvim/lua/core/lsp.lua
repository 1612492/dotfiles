vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local map = function(key, func)
      local opts = { noremap = true, silent = true, buffer = event.buf }
      vim.keymap.set("n", key, func, opts)
    end

    map("gra", vim.lsp.buf.code_action)
    map("grn", vim.lsp.buf.rename)
    map("grr", vim.lsp.buf.references)
    map("gri", vim.lsp.buf.implementation)
    map("grd", vim.lsp.buf.definition)
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
  },
})
