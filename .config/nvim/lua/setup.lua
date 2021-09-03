local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'terrortylor/nvim-comment'
  use 'TimUntersberger/neogit'
  use 'sindrets/diffview.nvim'
  use 'hrsh7th/nvim-compe'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'
  use 'nvim-treesitter/nvim-treesitter'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-ts-autotag'
  use 'hrsh7th/vim-vsnip'
  use 'tpope/vim-surround'
end)
