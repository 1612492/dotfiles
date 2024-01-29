local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostic = {
      underline = false,
      float = { border = "rounded" },
    },
    signs = {
      DiagnosticSignError = " ",
      DiagnosticSignWarn = " ",
      DiagnosticSignInfo = " ",
      DiagnosticSignHint = " ",
    },
  },
  config = function(_, opts)
    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.diagnostic.config(opts.diagnostic)

    for name, icon in pairs(opts.signs) do
      vim.fn.sign_define(name, { text = icon, texthl = name })
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
      astro = {},
      cssls = {},
      dockerls = {},
      gopls = {},
      html = {},
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      rust_analyzer = {},
      solidity_ls_nomicfoundation = {
        single_file_support = true,
      },
      svelte = {},
      tailwindcss = {},
    }

    for name, config in pairs(servers) do
      local extended_config = vim.tbl_extend("force", {
        capabilities = capabilities,
      }, config)

      require("lspconfig")[name].setup(extended_config)
    end
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = function()
        require("mason").setup({
          ui = {
            border = "rounded",
            width = 0.8,
            height = 0.8,
          },
        })

        local registry = require("mason-registry")

        local packages = {
          -- lsp
          "astro-language-server",
          "css-lsp",
          "dockerfile-language-server",
          "gopls",
          "html-lsp",
          "json-lsp",
          "lua-language-server",
          "nomicfoundation-solidity-language-server",
          "rust-analyzer",
          "svelte-language-server",
          "tailwindcss-language-server",
          "prettierd",
          "stylua",
        }

        registry.refresh(function()
          for _, p in ipairs(packages) do
            local package = registry.get_package(p)
            if not package:is_installed() then
              package:install()
            end
          end
        end)
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      version = false,
      event = "InsertEnter",
      dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
          "saadparwaiz1/cmp_luasnip",
          dependencies = {
            {
              "L3MON4D3/LuaSnip",
              build = "make install_jsregexp",
              dependencies = {
                "1612492/snippets"
              }
            },
          },
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
      config = function()
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
          -- preselect = cmp.PreselectMode.None,
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          formatting = {
            format = lspkind.cmp_format({
              mode = "symbol_text",
              ellipsis_char = "...",
            }),
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = {
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          },
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            {
              name = "buffer",
              option = {
                get_bufnrs = function()
                  return vim.api.nvim_list_bufs()
                end,
              },
            },
            { name = "path" },
          }),
        })
      end,
    },
    "b0o/schemastore.nvim",
    {
      "pmizio/typescript-tools.nvim",
      opts = {},
    },
  },
}
