local gitsigns = require("gitsigns")

gitsigns.setup({
  on_attach = function(buffer)
    local map = vim.keymap.set
    local opts = { buffer = buffer }

    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, opts)

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end, opts)

    map("n", "<leader>hR", gitsigns.reset_buffer, opts)
    map("n", "<leader>hr", gitsigns.reset_hunk, opts)
    map("n", "<leader>hb", gitsigns.blame_line, opts)
  end,
})
