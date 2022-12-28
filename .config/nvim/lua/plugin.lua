local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  require("config.impatient"),
  require("config.nvim-lspconfig"),
  require("config.catppuccin"),
  require("config.nvim-web-devicons"),
  require("config.nvim-autopairs"),
  require("config.barbar"),
  require("config.nvim-cmp"),
  require("config.nvim-colorizer"),
  require("config.mini-comment"),
  require("config.fzf-lua"),
  require("config.gitsigns"),
  require("config.indent-blankline"),
  require("config.lualine"),
  require("config.neoscroll"),
  require("config.nvim-surround"),
  require("config.nvim-tree"),
  require("config.nvim-treesitter"),
  require("config.markdown-preview"),
})
