function config()
  require("bufferline").setup({
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
end

return config
