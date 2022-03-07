local utils = require("utils")
local existed, gitsigns = pcall(require, "gitsigns")

if not existed then
  return
end

gitsigns.setup({
  on_attach = function()
    utils.set_key_map("n", "]c", "<cmd>Gitsigns next_hunk<CR>")
    utils.set_key_map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>")
    utils.set_key_map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
    utils.set_key_map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
    utils.set_key_map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    utils.set_key_map("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>")
    utils.set_key_map("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>")
  end,
})
