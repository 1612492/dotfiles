local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
  use 'vim-airline/vim-airline'
  use 'Yggdroot/indentLine'
  use 'tpope/vim-surround'
  use 'dense-analysis/ale'
  use 'tpope/vim-commentary'
  use 'alvan/vim-closetag'
  use 'psliwka/vim-smoothie'
  use '1612492/github.vim'
end)
