return {
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
  { "karb94/neoscroll.nvim", opts = {} },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
  "tpope/vim-surround",
  "nvim-lua/plenary.nvim",
}
