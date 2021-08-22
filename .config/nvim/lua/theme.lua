vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_dark_sidebar = false
vim.cmd[[colorscheme tokyonight]]

require("bufferline").setup{ options = {
    numbers = "ordinal",
    offsets = {{filetype = "NvimTree", text = "Explorer", highlight = "Directory", text_align = "left"}}
  }
}

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
