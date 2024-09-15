return {
  "sindrets/diffview.nvim",
  cmd = "DiffviewOpen",
  opts = {
    hooks = {
      view_opened = function()
        vim.cmd("CocDisable")
      end,
      view_closed = function()
        vim.cmd("CocEnable")
      end,
    },
  },
}
