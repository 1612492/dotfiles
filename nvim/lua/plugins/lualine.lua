return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "filename", path = 1 } },
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
        "g:coc_status",
        {
          "diagnostics",
          sources = { "coc" },
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
        "filetype",
      },
      lualine_y = { "branch" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix" },
  },
}
