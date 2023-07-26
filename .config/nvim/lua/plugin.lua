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
  { "catppuccin/nvim", priority = 1000, name = "catppuccin", config = require("config.catppuccin") },
  { "romgrk/barbar.nvim", config = require("config.barbar") },
  { "gelguy/wilder.nvim", config = require("config.wilder") },
  { "sindrets/diffview.nvim" },
  { "lewis6991/gitsigns.nvim", config = require("config.gitsigns") },
  { "lukas-reineke/indent-blankline.nvim", config = require("config.indent-blankline") },
  { "hoob3rt/lualine.nvim", config = require("config.lualine") },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = true,
  },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  { "numToStr/Comment.nvim", config = require("config.comment") },
  { "karb94/neoscroll.nvim", config = true },
  { "windwp/nvim-autopairs", config = require("config.nvim-autopairs") },
  { "norcalli/nvim-colorizer.lua", config = require("config.nvim-colorizer") },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "pmizio/typescript-tools.nvim", config = require("config.typescript-tools") },
      "jose-elias-alvarez/null-ls.nvim",
      "b0o/schemastore.nvim",
      {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = require("config.lspsaga"),
      },
      {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
              {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp",
              },
              "1612492/friendly-snippets",
            },
            config = require("config.luasnip"),
          },
        },
        config = require("config.nvim-cmp"),
      },
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
          "jayp0521/mason-null-ls.nvim",
        },
        config = require("config.mason"),
      },
    },
    config = require("config.nvim-lspconfig"),
  },
  { "tpope/vim-surround" },
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
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = require("config.telescope"),
  },
  { "stevearc/oil.nvim", config = require("config.oil") },
})
