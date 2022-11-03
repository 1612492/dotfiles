local status_ok, fzf = pcall(require, "fzf-lua")

if not status_ok then
  return
end

fzf.setup({
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
  previewers = {
    builtin = {
      extensions = {
        ["png"] = { "viu", "-b" },
        ["jpg"] = { "viu", "-b" },
      },
    },
  },
})
