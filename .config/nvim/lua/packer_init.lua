local existed, packer = pcall(require, "packer")

if not existed then
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
    use("lewis6991/impatient.nvim")
    use("folke/tokyonight.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("romgrk/barbar.nvim")
    use("hoob3rt/lualine.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("lukas-reineke/indent-blankline.nvim")
    use("terrortylor/nvim-comment")
    use({ "nvim-treesitter/nvim-treesitter", branch = "0.5-compat" })
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({ "nvim-treesitter/nvim-treesitter-textobjects", branch = "0.5-compat" })
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-project.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
    use("L3MON4D3/LuaSnip")
    use("jose-elias-alvarez/null-ls.nvim")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("karb94/neoscroll.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-surround")
  end,
  config = {
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  },
})

if not existed then
  vim.cmd("PackerSync")
end

return packer
