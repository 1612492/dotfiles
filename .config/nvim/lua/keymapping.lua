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
keymap("n", "<leader>hs", require("gitsigns").stage_hunk, opts)
keymap("n", "<leader>hr", require("gitsigns").reset_hunk, opts)
keymap("n", "<leader>hu", require("gitsigns").undo_stage_hunk, opts)
keymap("n", "<leader>hp", require("gitsigns").preview_hunk, opts)
