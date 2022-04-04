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
    use("numToStr/Comment.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("steelsojka/pears.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
    use("L3MON4D3/LuaSnip")
    use("jose-elias-alvarez/null-ls.nvim")
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use({ "hrsh7th/nvim-cmp", branch = "dev" })
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use("karb94/neoscroll.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-surround")
    use("b0o/schemastore.nvim")
    use("nathom/filetype.nvim")
    use("j-hui/fidget.nvim")
    use("antoinemadec/FixCursorHold.nvim")
  end,
  config = {
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  },
})

if not existed then
  vim.cmd("PackerSync")
end

return packer
