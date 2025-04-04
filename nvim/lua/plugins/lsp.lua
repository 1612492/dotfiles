return {
  { "b0o/SchemaStore.nvim", lazy = true, version = false },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = {
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
            vtsls = {
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("lspconfig.ui.windows").default_options.border = "rounded"
      local lspconfig = require("lspconfig")
      local handlers = vim.lsp.handlers
      local diagnostic = vim.diagnostic

      diagnostic.config({
        underline = false,
        float = { border = "rounded" },
        signs = {
          text = {
            [diagnostic.severity.ERROR] = " ",
            [diagnostic.severity.WARN] = " ",
            [diagnostic.severity.INFO] = " ",
            [diagnostic.severity.HINT] = " ",
          },
        },
      })
      handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, { border = "rounded" })
      handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, { border = "rounded" })

      for server, config in pairs(opts.servers) do
        config = type(config) == "function" and config() or config

        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}
