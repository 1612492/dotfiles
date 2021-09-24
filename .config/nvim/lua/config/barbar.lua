local utils = require("utils")
local existed, _ = pcall(require, "bufferline.nvim")

if not existed then
  return
end

vim.g.bufferline = {
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = "numbers",
  icon_separator_active = "",
  icon_separator_inactive = "",
  icon_close_tab_modified = "●",
  insert_at_end = true,
  no_name_title = "[No Name]",
}

utils.set_key_map("n", "<leader>1", ":BufferGoto 1<CR>")
utils.set_key_map("n", "<leader>2", ":BufferGoto 2<CR>")
utils.set_key_map("n", "<leader>3", ":BufferGoto 3<CR>")
utils.set_key_map("n", "<leader>4", ":BufferGoto 4<CR>")
utils.set_key_map("n", "<leader>5", ":BufferGoto 5<CR>")
utils.set_key_map("n", "<leader>6", ":BufferGoto 6<CR>")
utils.set_key_map("n", "<leader>7", ":BufferGoto 7<CR>")
utils.set_key_map("n", "<leader>8", ":BufferGoto 8<CR>")
utils.set_key_map("n", "<leader>9", ":BufferGoto 9<CR>")
utils.set_key_map("n", "<leader>0", ":BufferLast<CR>")
utils.set_key_map("n", "<leader>-", ":BufferClose<CR>")
utils.set_key_map("n", "<leader>=", ":BufferCloseAllButCurrent<CR>")
