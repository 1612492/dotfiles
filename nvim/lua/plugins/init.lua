return {
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
  },
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  "nvim-lua/plenary.nvim",
}
