local utils = require("utils")

if not utils.is_valid("indent-blankline.nvim") then
  return
end

require("indent_blankline").setup {
  char = "│",
  buftype_exclude = {"terminal"},
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
  show_first_indent_level = false,
}
