local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

for i = 1, 9 do
  keymap("n", ("<leader>%s"):format(i), (":BufferGoto %s<cr>"):format(i), opts)
end

keymap("n", "<leader>0", ":BufferPick<cr>", opts)
keymap("n", "<leader>-", ":BufferClose<cr>", opts)
keymap("n", "<leader>=", ":BufferCloseAllButCurrent<cr>", opts)

keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", opts)

keymap("n", "]c", "<cmd>lua require('gitsigns').next_hunk()<cr>", opts)
keymap("n", "[c", "<cmd>lua require('gitsigns').prev_hunk()<cr>", opts)
keymap("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", opts)
keymap("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", opts)
keymap("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", opts)
keymap("n", "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", opts)
