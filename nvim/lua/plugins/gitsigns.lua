return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = buffer
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "<leader>hr", gs.reset_hunk)
      map("n", "<leader>hR", gs.reset_buffer)
      map("n", "<leader>hp", gs.preview_hunk)
    end,
  },
}
