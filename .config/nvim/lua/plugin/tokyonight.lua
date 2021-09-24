local existed, _ = pcall(require, "tokyonight")

if not existed then
  return
end

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_float = false
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_lualine_bold = true
vim.cmd([[colorscheme tokyonight]])
