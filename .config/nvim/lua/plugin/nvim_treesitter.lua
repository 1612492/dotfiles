local existed, _ = pcall(require, "nvim-treesitter")

if not existed then
  return
end

require("nvim-treesitter.configs").setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = "maintained",
  indent = { enable = true },
  highlight = { enable = true },
  keymaps = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
  },
})
