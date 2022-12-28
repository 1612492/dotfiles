local utils = require("utils")

for i = 1, 9 do
  utils.set_key_map("n", ("<leader>%s"):format(i), (":BufferGoto %s<cr>"):format(i))
end

utils.set_key_map("n", "<leader>0", ":BufferPick<cr>")
utils.set_key_map("n", "<leader>-", ":BufferClose<cr>")
utils.set_key_map("n", "<leader>=", ":BufferCloseAllButCurrent<cr>")

utils.set_key_map("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<cr>")
utils.set_key_map("n", "<leader>g", "<cmd>lua require('fzf-lua').live_grep()<cr>")
utils.set_key_map("n", "<leader>b", "<cmd>lua require('fzf-lua').buffers()<cr>")

utils.set_key_map("n", "]c", "<cmd>lua require('gitsigns').next_hunk()<cr>")
utils.set_key_map("n", "[c", "<cmd>lua require('gitsigns').prev_hunk()<cr>")
utils.set_key_map("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<cr>")
utils.set_key_map("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<cr>")
utils.set_key_map("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>")
utils.set_key_map("n", "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<cr>")
utils.set_key_map("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line()<cr>")

utils.set_key_map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
