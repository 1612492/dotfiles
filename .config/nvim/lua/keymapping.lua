local utils = require("utils")

utils.set_key_map("n", "<leader>1", ":BufferGoto 1<cr>")
utils.set_key_map("n", "<leader>2", ":BufferGoto 2<cr>")
utils.set_key_map("n", "<leader>3", ":BufferGoto 3<cr>")
utils.set_key_map("n", "<leader>4", ":BufferGoto 4<cr>")
utils.set_key_map("n", "<leader>5", ":BufferGoto 5<cr>")
utils.set_key_map("n", "<leader>6", ":BufferGoto 6<cr>")
utils.set_key_map("n", "<leader>7", ":BufferGoto 7<cr>")
utils.set_key_map("n", "<leader>8", ":BufferGoto 8<cr>")
utils.set_key_map("n", "<leader>9", ":BufferGoto 9<cr>")
utils.set_key_map("n", "<leader>0", ":BufferPick<cr>")
utils.set_key_map("n", "<leader>-", ":BufferClose<cr>")
utils.set_key_map("n", "<leader>=", ":BufferCloseAllButCurrent<cr>")

utils.set_key_map("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<cr>")
utils.set_key_map("n", "<leader>g", "<cmd>lua require('fzf-lua').live_grep()<cr>")

utils.set_key_map("n", "]c", "<cmd>lua require('gitsigns').next_hunk()<cr>")
utils.set_key_map("n", "[c", "<cmd>lua require('gitsigns').prev_hunk()<cr>")
utils.set_key_map("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<cr>")
utils.set_key_map("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<cr>")
utils.set_key_map("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>")
utils.set_key_map("n", "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<cr>")
utils.set_key_map("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line()<cr>")

utils.set_key_map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

utils.set_key_map("n", "zR", "<cmd>lua require('ufo').openAllFolds()<cr>")
utils.set_key_map("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<cr>")
