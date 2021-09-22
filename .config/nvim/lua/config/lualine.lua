local utils = require("utils")

if not utils.is_valid("lualine.nvim") then
  return
end

require("lualine").setup {
  options = {
    theme = "tokyonight",
    component_separators = {'', ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {{"diagnostics", sources = {"nvim_lsp"}}, 'filetype'},
    lualine_y = {},
    lualine_z = {'location'}
  },
  extensions = {"nvim-tree", "quickfix"}
}
