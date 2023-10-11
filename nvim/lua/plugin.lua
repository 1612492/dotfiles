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
  { "nvim-lua/plenary.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = require("config.catppuccin"),
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    "romgrk/barbar.nvim",
    config = require("config.barbar"),
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require("config.gitsigns"),
  },
  { "sindrets/diffview.nvim" },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = require("config.lualine"),
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    config = true,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
  },
  {
    "numToStr/Comment.nvim",
    config = require("config.comment"),
  },
  {
    "karb94/neoscroll.nvim",
    config = true,
  },
  { "tpope/vim-surround" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = require("config.nvim-autopairs"),
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = require("config.nvim-colorizer"),
  },
  {
    "neovim/nvim-lspconfig",
    config = require("lsp"),
    dependencies = {
      "b0o/schemastore.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      {
        "pmizio/typescript-tools.nvim",
        config = true,
      },
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = require("config.mason"),
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
          "jay-babu/mason-null-ls.nvim",
          "jay-babu/mason-nvim-dap.nvim",
        },
      },
      {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = require("config.nvim-cmp"),
        dependencies = {
          "onsails/lspkind.nvim",
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
            },
            config = require("config.luasnip"),
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = require("config.nvim-treesitter"),
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "InsertEnter",
    config = require("config.nvim-ufo"),
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = require("config.telescope"),
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
  },
  {
    "stevearc/oil.nvim",
    config = require("config.oil"),
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = require("config.fidget"),
  },
  {
    "stevearc/dressing.nvim",
    config = require("config.dressing"),
  },
  {
    "akinsho/flutter-tools.nvim",
    config = true,
  },
  {
    "folke/neodev.nvim",
    config = require("config.neodev"),
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      config = true,
    },
  },
}, {
  ui = {
    border = "rounded",
  },
})
