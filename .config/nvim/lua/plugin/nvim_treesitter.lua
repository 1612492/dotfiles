local existed, _ = pcall(require, "nvim-treesitter")

if not existed then
  return
end

require("nvim-treesitter.configs").setup({
  auto_install = true,
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    "css",
    "dockerfile",
    "go",
    "gomod",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "scss",
    "solidity",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  sync_install = true,
  indent = { enable = true },
  highlight = { enable = true },
})
