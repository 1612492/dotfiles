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
                globals = { "Snacks", "vim" },
              },
            },
          },
        },
        solidity_ls = {},
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
      vim.diagnostic.config({
        underline = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
          },
        },
      })

      for server, config in pairs(opts.servers) do
        config = type(config) == "function" and config() or config
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        require("lspconfig")[server].setup(config)
      end
    end,
  },
}
