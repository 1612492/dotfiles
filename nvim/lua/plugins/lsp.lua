return {
  { "b0o/SchemaStore.nvim", lazy = true, version = false },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = {
      signs = {
        DiagnosticSignError = " ",
        DiagnosticSignWarn = " ",
        DiagnosticSignInfo = " ",
        DiagnosticSignHint = " ",
      },
      servers = {
        cssls = {},
        html = {},
        jsonls = function()
          return { settings = { json = { schemas = require("schemastore").json.schemas() } } }
        end,
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        tailwindcss = {},
        vtsls = {
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("lspconfig.ui.windows").default_options.border = "rounded"
      local handlers = vim.lsp.handlers
      local diagnostic = vim.diagnostic

      diagnostic.config({ underline = false, float = { border = "rounded" } })
      handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, { border = "rounded" })
      handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, { border = "rounded" })

      for name, icon in pairs(opts.signs) do
        vim.fn.sign_define(name, { text = icon, texthl = name })
      end

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      for name, option in pairs(opts.servers) do
        option = type(option) == "function" and option() or option

        require("lspconfig")[name].setup(vim.tbl_extend("force", {
          capabilities = capabilities,
        }, option))
      end
    end,
  },
}
