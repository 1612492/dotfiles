local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = false,
      update_in_insert = false,
      underline = false,
    })

    vim.diagnostic.config({ float = { border = "rounded" } })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

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
      "nvimtools/none-ls.nvim",
      config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
          border = "rounded",
          sources = {
            null_ls.builtins.code_actions.eslint_d,
            null_ls.builtins.diagnostics.eslint_d.with({
              condition = function(utils)
                return utils.root_has_file({ ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs" })
              end,
            }),
            null_ls.builtins.formatting.prettierd.with({
              extra_filetypes = { "astro", "solidity", "svelte", "svg" },
            }),
            null_ls.builtins.formatting.stylua.with({
              extra_args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" },
            }),
            null_ls.builtins.formatting.gofumpt,
            null_ls.builtins.formatting.goimports_reviser,
            null_ls.builtins.formatting.golines,
          },
        })
      end,
    },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jay-babu/mason-null-ls.nvim",
      },
      config = function()
        require("mason").setup({
          ui = {
            border = "rounded",
            width = 0.8,
            height = 0.8,
          },
        })

        require("mason-lspconfig").setup({
          automatic_installation = true,
          ensure_installed = {
            "astro",
            "cssls",
            "dockerls",
            "gopls",
            "html",
            "jsonls",
            "lua_ls",
            "rust_analyzer",
            "solidity_ls_nomicfoundation",
            "svelte",
            "tailwindcss",
          },
        })

        require("mason-null-ls").setup({
          automatic_installation = true,
          ensure_installed = {
            "eslint_d",
            "gofumpt",
            "goimports-reviser",
            "golines",
            "prettierd",
            "stylua",
          },
        })
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
          "windwp/nvim-autopairs",
          event = "InsertEnter",
          opts = {
            check_ts = true,
            ts_config = {
              lua = { "string", "source" },
              javascript = { "string", "template_string" },
            },
            disable_in_macro = true,
            disable_in_visualblock = true,
            map_c_w = true,
          },
        },
        {
          "saadparwaiz1/cmp_luasnip",
          dependencies = {
            {
              "L3MON4D3/LuaSnip",
              build = "make install_jsregexp",
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
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        cmp.setup({
          preselect = cmp.PreselectMode.None,
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
            completion = cmp.config.window.bordered({
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
              scrollbar = false,
            }),
            documentation = cmp.config.window.bordered({
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            }),
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
      config = true,
    },
  },
}
