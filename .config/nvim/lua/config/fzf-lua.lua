return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
      winopts = {
        hl = {
          normal = "Normal",
          border = "FloatBorder",
          help_normal = "Normal",
          help_border = "FloatBorder",
          cursor = "Cursor",
          cursorline = "CursorLine",
          cursorlinenr = "CursorLineNr",
          search = "IncSearch",
          title = "Normal",
          scrollfloat_e = "PmenuSbar",
          scrollfloat_f = "PmenuThumb",
          scrollborder_e = "FloatBorder",
          scrollborder_f = "FloatBorder",
        },
      },
    })
  end,
}
