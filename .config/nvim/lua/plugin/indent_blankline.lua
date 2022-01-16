local existed, indent_blankline = pcall(require, "indent_blankline")

if not existed then
  return
end

indent_blankline.setup({
  char = "│",
  buftype_exclude = { "terminal" },
  filetype_exclude = {
    "markdown",
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_current_context = true,
  show_end_of_line = true,
  show_first_indent_level = true,
})
