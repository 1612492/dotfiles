return {
  "sindrets/diffview.nvim",
  cmd = "DiffviewOpen",
  opts = {
    hooks = {
      view_opened = function()
        vim.cmd("silent! CocDisable")
      end,
      view_closed = function()
        vim.cmd("silent! CocEnable")
      end,
    },
  },
}
