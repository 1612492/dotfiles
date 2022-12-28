local status_ok, packer = pcall(require, "packer")

local icons = require("icons")

if not status_ok then
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  print("Cloning packer...")
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
  vim.cmd("packadd packer.nvim")

  _, packer = pcall(require, "packer")
  print("Success")
end

packer.startup({
  function()
    use("wbthomason/packer.nvim")
    use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("config.catppuccin")
      end,
    })
    use({
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("config.devicons")
      end,
    })
    use({
      "neovim/nvim-lspconfig",
      requires = {
        "jose-elias-alvarez/null-ls.nvim",
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
        "b0o/schemastore.nvim",
      },
    })
    use("nvim-lua/plenary.nvim")
    use({
      "windwp/nvim-autopairs",
      config = function()
        require("config.autopairs")
      end,
    })
    use({
      "romgrk/barbar.nvim",
      config = function()
        require("config.barbar")
      end,
    })
    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("config.cmp")
      end,
      requires = {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
      },
    })
    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("config.colorizer")
      end,
    })
    use({
      "echasnovski/mini.comment",
      config = function()
        require("config.comment")
      end,
    })
    use({
      "ibhagwan/fzf-lua",
      config = function()
        require("config.fzf")
      end,
    })
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.gitsigns")
      end,
    })
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("config.indent")
      end,
    })
    use({
      "hoob3rt/lualine.nvim",
      config = function()
        require("config.lualine")
      end,
    })
    use({
      "L3MON4D3/LuaSnip",
      config = function()
        require("config.luasnip")
      end,
      requires = {
        "rafamadriz/friendly-snippets",
      },
    })
    use({
      "karb94/neoscroll.nvim",
      config = function()
        require("config.neoscroll")
      end,
    })
    use({
      "kylechui/nvim-surround",
      config = function()
        require("config.surround")
      end,
    })
    use({
      "nvim-tree/nvim-tree.lua",
      tag = "nightly",
      config = function()
        require("config.tree")
      end,
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter")
      end,
      requires = {
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
    use("lewis6991/impatient.nvim")
    use("antoinemadec/FixCursorHold.nvim")
  end,
  config = {
    compile_path = vim.fn.stdpath("config") .. "/lua/plugin_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
      working_sym = icons.Pending,
      error_sym = icons.Failure,
      done_sym = icons.Success,
    },
  },
})

if not status_ok then
  vim.cmd("PackerSync")
end

return packer
