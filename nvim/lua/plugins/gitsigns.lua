return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    on_attach = function(buffer)
      local gs = require("gitsigns")

      local function map(mode, l, r)
        vim.keymap.set(mode, l, r, { buffer = buffer })
      end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end)

      map("n", "<leader>hr", gs.reset_hunk)
      map("n", "<leader>hR", gs.reset_buffer)
    end,
  },
}
