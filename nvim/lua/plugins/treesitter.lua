return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
      auto_install = true,
      ensure_installed = { "c", "lua", "query", "vim", "vimdoc" },
      indent = { enable = true },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_size = 100 * 1024 -- 100 KB
          local max_line = 10000
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

          if ok and stats and stats.size > max_size then
            return true
          end

          if vim.api.nvim_buf_line_count(buf) > max_line then
            return true
          end
        end,
      },
    },
  },
}
