vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local function map(mode, l, r)
      local opts = { noremap = true, silent = true, buffer = args.buf }
      vim.keymap.set(mode, l, r, opts)
    end

    map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action)
    map("n", "gR", vim.lsp.buf.rename)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gt", vim.lsp.buf.type_definition)
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "gr", vim.lsp.buf.references)

    map("n", "<C-k>", vim.lsp.buf.signature_help)
    map("n", "K", vim.lsp.buf.hover)

    map("n", "[d", vim.diagnostic.goto_prev)
    map("n", "]d", vim.diagnostic.goto_next)
    map("n", "gf", function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = args.buf,
      })
    end)
  end,
})
