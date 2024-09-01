return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "garymjr/nvim-snippets",
      opts = {
        extended_filetypes = {
          typescript = { "javascript" },
          typescriptreact = { "javascript" },
        },
      },
      keys = {
        {
          "<c-j>",
          function()
            if vim.snippet.active({ direction = 1 }) then
              vim.snippet.jump(1)
            end
          end,
          mode = { "i", "s" },
        },
        {
          "<c-k>",
          function()
            if vim.snippet.active({ direction = -1 }) then
              vim.snippet.jump(-1)
            end
          end,
          mode = { "i", "s" },
        },
      },
    },
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      preselect = cmp.PreselectMode.None,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ["<c-n>"] = cmp.mapping.select_next_item(),
        ["<c-p>"] = cmp.mapping.select_prev_item(),
        ["<c-u>"] = cmp.mapping.scroll_docs(-4),
        ["<c-d>"] = cmp.mapping.scroll_docs(4),
        ["<cr>"] = cmp.mapping.confirm(),
        ["<c-e>"] = cmp.mapping.abort(),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippets" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
