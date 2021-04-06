local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'kaicataldo/material.vim', branch = 'main'}
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'vim-airline/vim-airline'
  use 'psliwka/vim-smoothie'
  use 'tpope/vim-surround'
  use 'dense-analysis/ale'
  use 'akinsho/nvim-bufferline.lua'
  use 'terrortylor/nvim-comment'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
end)
