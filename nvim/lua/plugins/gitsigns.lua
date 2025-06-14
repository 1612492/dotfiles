return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(buffer)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      map("n", "<leader>hr", gitsigns.reset_hunk)
      map("n", "<leader>hb", gitsigns.blame_line)
    end,
  },
}
