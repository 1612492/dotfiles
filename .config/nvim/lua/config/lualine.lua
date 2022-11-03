local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

lualine.setup({
  options = {
    theme = "base16",
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {},
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { { "diagnostics", sources = { "nvim_diagnostic" } }, "filetype" },
    lualine_y = {},
    lualine_z = { "location" },
  },
  extensions = { "nvim-tree", "quickfix" },
})
