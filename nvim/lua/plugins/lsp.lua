return {
  { "b0o/SchemaStore.nvim", lazy = true },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      { "pmizio/typescript-tools.nvim", opts = {} },
    },
    opts = {
      signs = {
        DiagnosticSignError = " ",
        DiagnosticSignWarn = " ",
        DiagnosticSignInfo = " ",
        DiagnosticSignHint = " ",
      },
      servers = {
        astro = {},
        cssls = {},
        dockerls = {},
        gopls = {},
        html = {},
        jsonls = {},
        lua_ls = {},
        rust_analyzer = {},
        solidity_ls_nomicfoundation = {
          single_file_support = true,
        },
        svelte = {},
        tailwindcss = {},
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

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for name, option in pairs(opts.servers) do
        if name == "jsonls" then
          option.settings = { json = { schemas = require("schemastore").json.schemas() } }
        end

        require("lspconfig")[name].setup(vim.tbl_extend("force", {
          capabilities = capabilities,
        }, option))
      end
    end,
  },
}
