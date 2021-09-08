local cmd = vim.cmd
local fn = vim.fn
local ok, packer = pcall(require, "packer")

if not ok then
  local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  print("Cloning packer...")
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
  cmd 'packadd packer.nvim'

  ok, packer = pcall(require, "packer")

  if ok then
    print("Successfully")
  end 
end

return packer.startup({
  function()
    use "wbthomason/packer.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "folke/tokyonight.nvim"
    use "romgrk/barbar.nvim"
    use "hoob3rt/lualine.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "lukas-reineke/indent-blankline.nvim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "TimUntersberger/neogit"
    use {
      "terrortylor/nvim-comment", 
      requires = { "JoosepAlviste/nvim-ts-context-commentstring"}
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-project.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
      }
    }
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
    use {
      "L3MON4D3/LuaSnip",
      requires = { "rafamadriz/friendly-snippets" }
    }
    use {
      "neovim/nvim-lspconfig",
      requires = {
        "jose-elias-alvarez/null-ls.nvim",
        "jose-elias-alvarez/nvim-lsp-ts-utils"
      }
    }
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip"
      }
    }
    use "tpope/vim-surround"
    use "windwp/nvim-ts-autotag"
    use "karb94/neoscroll.nvim"
    use "norcalli/nvim-colorizer.lua"
    use {"lewis6991/gitsigns.nvim", requires = {'nvim-lua/plenary.nvim'}}
    use "sindrets/diffview.nvim"
    use "windwp/nvim-autopairs"
  end, 
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
      prompt_border = "single",
    },
    git = { clone_timeout = 600 }
  }
})
