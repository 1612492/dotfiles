local existed, theme = pcall(require, "tokyonight")

if not existed then
  return
end

require("tokyonight").setup({
  style = "storm",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { italic = true },
    variables = { italic = true },
    sidebars = "normal",
    floats = "normal",
  },
})

vim.cmd([[colorscheme tokyonight]])
