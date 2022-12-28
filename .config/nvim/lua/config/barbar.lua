local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  return
end

local icons = require("icons")

bufferline.setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = "numbers",
  icon_separator_active = "",
  icon_separator_inactive = "",
  icon_close_tab_modified = icons.Dot,
  insert_at_end = true,
})
