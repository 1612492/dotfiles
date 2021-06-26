return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "hoob3rt/lualine.nvim"
  use "akinsho/nvim-bufferline.lua"
  use "neovim/nvim-lspconfig"
  use "terrortylor/nvim-comment"
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use "hrsh7th/nvim-compe"
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "lewis6991/gitsigns.nvim"
  use "folke/tokyonight.nvim"
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
  use "tpope/vim-surround"
  use "glepnir/lspsaga.nvim"
  use "folke/trouble.nvim"
  use 'SirVer/ultisnips'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'windwp/nvim-autopairs'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-ts-autotag'
end)
