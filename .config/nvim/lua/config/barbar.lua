return {
  "romgrk/barbar.nvim",
  config = function()
    local icons = require("icons")

    require("bufferline").setup({
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
  end,
}
