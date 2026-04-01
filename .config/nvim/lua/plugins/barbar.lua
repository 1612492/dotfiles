vim.g.barbar_auto_setup = false

require("barbar").setup({
  icons = {
    buffer_index = true,
    button = "",
    filetype = { enabled = false },
    separator = { left = "", right = "" },
    modified = { button = "" },
    inactive = { separator = { left = "", right = "" } },
  },
  insert_at_end = true,
  no_name_title = "NO NAME",
})
