local map = vim.keymap.set

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    pcall(vim.treesitter.start, args.buf, lang)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { noremap = true, silent = true, buffer = event.buf }

    map("n", "ga", vim.lsp.buf.code_action, opts)
    map("n", "gn", vim.lsp.buf.rename, opts)
    map("n", "gr", Snacks.picker.lsp_references, opts)
    map("n", "gi", Snacks.picker.lsp_implementations, opts)
    map("n", "gd", Snacks.picker.lsp_definitions, opts)
    map("n", "gD", Snacks.picker.lsp_declarations, opts)
    map("n", "gy", Snacks.picker.lsp_type_definitions, opts)
    map("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    map("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
  end,
})
