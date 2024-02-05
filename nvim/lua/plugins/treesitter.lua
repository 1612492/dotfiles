return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = { "c", "lua", "query", "vim", "vimdoc" },
        indent = { enable = true },
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
