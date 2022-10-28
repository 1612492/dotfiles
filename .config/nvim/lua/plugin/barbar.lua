local utils = require("utils")
local existed, bufferline = pcall(require, "bufferline")

if not existed then
  return
end

bufferline.setup({
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
})

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
