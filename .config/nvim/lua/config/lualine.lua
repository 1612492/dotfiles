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
          symbols = {
            modified = "●",
          },
          path = 1,
        },
      },
      lualine_c = {
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
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
