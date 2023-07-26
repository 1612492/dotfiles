return function()
  vim.g.barbar_auto_setup = false

  require("barbar").setup({
    animation = true,
    auto_hide = false,
    tabpages = false,
    clickable = true,
    icons = {
      buffer_index = true,
      button = "",
      filetype = { enabled = false },
      separator = { left = "", right = "" },
      modified = { button = "" },
      inactive = { separator = { left = "", right = "" } },
    },
    semantic_letters = true,
    insert_at_end = true,
    no_name_title = "NO NAME",
  })
end
