return {
  "stevearc/oil.nvim",
  keys = {
    {
      "<leader>e",
      function()
        require("oil").open()
      end,
    },
  },
  opts = {
    delete_to_trash = true,
  },
}
