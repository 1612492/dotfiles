return {
  "romgrk/barbar.nvim",
  init = function()
    vim.g.barbar_auto_setup = false

    for i = 1, 9 do
      vim.keymap.set("n", ("<leader>%s"):format(i), ("<cmd>BufferGoto %s<cr>"):format(i), { silent = true })
    end

    vim.keymap.set("n", "<leader>0", "<cmd>BufferPick<cr>", { silent = true })
    vim.keymap.set("n", "<leader>-", "<cmd>BufferClose<cr>", { silent = true })
    vim.keymap.set("n", "<leader>=", "<cmd>BufferCloseAllButCurrent<cr>", { silent = true })
  end,
  opts = {
    icons = {
      buffer_index = true,
      button = "",
      filetype = { enabled = false },
      separator = { left = "", right = "" },
      modified = { button = "" },
      inactive = { separator = { left = "", right = "" } },
    },
    insert_at_end = true,
    no_name_title = "NO NAME",
  },
}
