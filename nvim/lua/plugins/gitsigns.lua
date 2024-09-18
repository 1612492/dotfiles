return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(buffer)
      local gs = require("gitsigns")
      local map = vim.keymap.set
      local opts = { buffer = buffer }

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, opts)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, opts)

      map("n", "<leader>hr", gs.reset_hunk, opts)
      map("n", "<leader>hR", gs.reset_buffer, opts)
    end,
  },
}
