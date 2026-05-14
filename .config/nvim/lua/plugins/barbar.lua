return {
  "romgrk/barbar.nvim",
  init = function()
    vim.g.barbar_auto_setup = false

    local map = function(key, func)
      local opts = { silent = true }
      vim.keymap.set("n", key, func, opts)
    end

    for i = 1, 9 do
      map(("<leader>%s"):format(i), ("<cmd>BufferGoto %s<cr>"):format(i))
    end

    map("<leader>0", "<cmd>BufferPick<cr>")
    map("<leader>-", "<cmd>BufferClose<cr>")
    map("<leader>=", "<cmd>BufferCloseAllButCurrent<cr>")
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
