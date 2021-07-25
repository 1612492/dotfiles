require("lualine").setup {
  options = {
    theme = "tokyonight",
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {{"filename", path = 1}},
    lualine_x = {{"diagnostics", sources = {"nvim_lsp"}}},
    lualine_y = {"filetype"},
    lualine_z = {"location"}
  },
  extensions = {'nvim-tree'}
}

