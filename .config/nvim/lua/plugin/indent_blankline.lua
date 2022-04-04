local existed, indent_blankline = pcall(require, "indent_blankline")

if not existed then
  return
end

indent_blankline.setup({
  char = "│",
  buftype_exclude = { "terminal", "help", "nofile", "nowrite", "quickfix", "prompt" },
  filetype_exclude = { "markdown", "help" },
  show_trailing_blankline_indent = false,
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = true,
})
