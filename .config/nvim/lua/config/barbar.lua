local utils = require("utils")

if not utils.is_valid("barbar.nvim") then
  return
end

vim.g.bufferline = {
  animation = true,
  auto_hide = false,
  closable = true,
  icons = "numbers",
  icon_separator_active = "",
  icon_separator_inactive = "",
  icon_close_tab_modified = "●",
  no_name_title = "[No Name]",
}

utils.key_map("n", "<leader>1", ":BufferGoto 1<CR>")
utils.key_map("n", "<leader>2", ":BufferGoto 2<CR>")
utils.key_map("n", "<leader>3", ":BufferGoto 3<CR>")
utils.key_map("n", "<leader>4", ":BufferGoto 4<CR>")
utils.key_map("n", "<leader>5", ":BufferGoto 5<CR>")
utils.key_map("n", "<leader>6", ":BufferGoto 6<CR>")
utils.key_map("n", "<leader>7", ":BufferGoto 7<CR>")
utils.key_map("n", "<leader>8", ":BufferGoto 8<CR>")
utils.key_map("n", "<leader>9", ":BufferGoto 9<CR>")
utils.key_map("n", "<leader>0", ":BufferLast<CR>")
utils.key_map("n", "<leader>-", ":BufferClose<CR>")
utils.key_map("n", "<leader>=", ":BufferCloseAllButCurrent<CR>")
