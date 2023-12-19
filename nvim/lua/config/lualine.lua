local icon = require("icon")

return function()
  require("lualine").setup({
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
          path = 1,
        },
      },
      lualine_c = {
        {
          "diff",
          symbols = {
            added = icon.added_outline,
            modified = icon.modified_outline,
            removed = icon.removed_outline,
          },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icon.error,
            warn = icon.warn,
            info = icon.info,
            hint = icon.hint,
          },
        },
        "filetype",
      },
      lualine_y = { "branch" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix" },
  })
end
