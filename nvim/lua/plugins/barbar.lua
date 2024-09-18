return {
  "romgrk/barbar.nvim",
  init = function()
    vim.g.barbar_auto_setup = false

    local map = vim.keymap.set
    local opts = { silent = true }

    for i = 1, 9 do
      map("n", ("<leader>%s"):format(i), ("<cmd>BufferGoto %s<cr>"):format(i), opts)
    end

    map("n", "<leader>0", "<cmd>BufferPick<cr>", opts)
    map("n", "<leader>-", "<cmd>BufferClose<cr>", opts)
    map("n", "<leader>=", "<cmd>BufferCloseAllButCurrent<cr>", opts)
  end,
  opts = {
    icons = {
      buffer_index = true,
      button = "",
      filetype = { enabled = false },
      separator = { left = "", right = "" },
      modified = { button = "" },
      inactive = { separator = { left = "", right = "" } },
    },
    insert_at_end = true,
    no_name_title = "NO NAME",
  },
}
