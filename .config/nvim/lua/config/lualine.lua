local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

local icons = require("icons")

lualine.setup({
  options = {
    theme = "catppuccin",
    icons_enabled = true,
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "filename",
        symbols = {
          modified = icons.Dot,
        },
        path = 1,
      },
    },
    lualine_c = {
      {
        "diff",
        symbols = {
          added = icons.Added,
          modified = icons.Modified,
          removed = icons.Removed,
        },
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = icons.Error,
          warn = icons.Warn,
          info = icons.Info,
          hint = icons.Hint,
        },
      },
      "filetype",
    },
    lualine_y = { "branch" },
    lualine_z = { "location" },
  },
  extensions = { "fzf", "nvim-tree", "quickfix" },
})
