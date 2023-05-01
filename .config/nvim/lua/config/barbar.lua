function config()
  vim.g.barbar_auto_setup = false

  require("barbar").setup({
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    icons = {
      buffer_index = true,
      filetype = { enabled = false },
      separator = { left = "", right = "" },
      modified = { button = "●" },
      inactive = { separator = { left = "", right = "" } },
    },
    insert_at_end = true,
  })
end

return config
