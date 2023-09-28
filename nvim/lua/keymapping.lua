local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

for i = 1, 9 do
  keymap("n", ("<leader>%s"):format(i), (":BufferGoto %s<cr>"):format(i), opts)
end

keymap("n", "<leader>0", ":BufferPick<cr>", opts)
keymap("n", "<leader>-", ":BufferClose<cr>", opts)
keymap("n", "<leader>=", ":BufferCloseAllButCurrent<cr>", opts)

keymap("n", "<leader>f", require("telescope.builtin").find_files, opts)
keymap("n", "<leader>g", require("telescope.builtin").live_grep, opts)
keymap("n", "<leader>e", require("oil").open, opts)
keymap("n", "]c", require("gitsigns").next_hunk, opts)
keymap("n", "[c", require("gitsigns").prev_hunk, opts)

keymap("n", "<leader>hr", require("gitsigns").reset_hunk, opts)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local opts = { noremap = true, silent = true, buffer = args.buf }

    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    keymap({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
    keymap('n', 'gR', vim.lsp.buf.rename, opts)
    keymap('n', 'gd', vim.lsp.buf.definition, opts)
    keymap('n', 'gt', vim.lsp.buf.type_definition, opts)
    keymap('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap('n', 'gr', vim.lsp.buf.references, opts)

    keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    keymap('n', 'K', vim.lsp.buf.hover, opts)

    keymap('n', '[d', vim.diagnostic.goto_prev)
    keymap('n', ']d', vim.diagnostic.goto_next)

    keymap('n', 'gf', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
