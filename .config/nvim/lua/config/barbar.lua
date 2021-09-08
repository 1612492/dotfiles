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
