local cmd = vim.cmd
local fn = vim.fn
local ok, packer = pcall(require, "packer")

if not ok then
  local packer_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

  print("Cloning packer...")
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path})
  cmd "packadd packer.nvim"

  ok, packer = pcall(require, "packer")

  if ok then
    print("Successfully")
  end 
end

return packer.startup({
  function()
    use "wbthomason/packer.nvim"
    use "folke/tokyonight.nvim"
    use {"romgrk/barbar.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use {"hoob3rt/lualine.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"}
    use "lukas-reineke/indent-blankline.nvim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "terrortylor/nvim-comment"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use {"nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim"}
    use "nvim-telescope/telescope-project.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    use "jose-elias-alvarez/null-ls.nvim"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"
    use "karb94/neoscroll.nvim"
    use "norcalli/nvim-colorizer.lua"
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use "tpope/vim-surround"
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
