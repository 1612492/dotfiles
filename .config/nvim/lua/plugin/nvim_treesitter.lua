local existed, _ = pcall(require, "nvim-treesitter")

if not existed then
  return
end

require("nvim-treesitter.configs").setup({
  autopairs = { enable = true },
  autotag = { enable = true },
  ensure_installed = "maintained",
  indent = { enable = true },
  highlight = { enable = true },
})
