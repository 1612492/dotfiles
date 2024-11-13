return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      local luasnip = require("luasnip")
      local map = vim.keymap.set
      local opts = { silent = true }

      map({ "i", "s" }, "<c-j>", function()
        luasnip.jump(1)
      end, opts)

      map({ "i", "s" }, "<c-k>", function()
        luasnip.jump(-1)
      end, opts)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        sorting = defaults.sorting,
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ["<c-u>"] = cmp.mapping.scroll_docs(-4),
          ["<c-d>"] = cmp.mapping.scroll_docs(4),
          ["<c-e>"] = cmp.mapping.abort(),
          ["<c-n>"] = cmp.mapping.select_next_item(),
          ["<c-p>"] = cmp.mapping.select_prev_item(),
          ["<cr>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          {
            name = "buffer",
            option = {
              get_bufnrs = vim.api.nvim_list_bufs,
            },
          },
        }),
      })
    end,
  },
}
