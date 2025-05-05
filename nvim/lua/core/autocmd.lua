vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local function map(mode, l, r)
      local opts = { noremap = true, silent = true, buffer = args.buf }
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<leader>a", vim.lsp.buf.code_action)
    map("n", "gR", vim.lsp.buf.rename)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gd", vim.lsp.buf.definition)

    map("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end)

    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "]d", vim.diagnostic.goto_next)
  end,
})
