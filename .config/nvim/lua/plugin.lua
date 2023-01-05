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
  { "romgrk/barbar.nvim", config = require("config.barbar") },
  { "catppuccin/nvim", name = "catppuccin", config = require("config.catppuccin") },
  { "sindrets/diffview.nvim" },
  { "j-hui/fidget.nvim", config = require("config.fidget") },
  { "ibhagwan/fzf-lua", config = require("config.fzf-lua") },
  { "lewis6991/gitsigns.nvim", config = true },
  { "lukas-reineke/indent-blankline.nvim", config = require("config.indent-blankline") },
  { "hoob3rt/lualine.nvim", config = require("config.lualine") },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  { "echasnovski/mini.comment", config = require("config.mini.comment") },
  { "karb94/neoscroll.nvim", config = true },
  { "windwp/nvim-autopairs", config = require("config.nvim-autopairs") },
  { "norcalli/nvim-colorizer.lua", config = require("config.nvim-colorizer") },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "b0o/schemastore.nvim",
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
              "L3MON4D3/LuaSnip",
              "rafamadriz/friendly-snippets",
            },
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
        config = require("config.nvim-cmp"),
      },
      {
        "williamboman/mason.nvim",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
          "jayp0521/mason-null-ls.nvim",
        },
        config = require("config.mason"),
      },
      {},
    },
    config = require("config.nvim-lspconfig"),
  },
  { "kylechui/nvim-surround", config = true },
  { "nvim-tree/nvim-tree.lua", tag = "nightly", config = require("config.nvim-tree") },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = require("config.nvim-treesitter"),
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = require("config.nvim-ufo"),
  },
  { "kyazdani42/nvim-web-devicons", config = require("config.nvim-web-devicons") },
  { "nvim-lua/plenary.nvim" },
})
