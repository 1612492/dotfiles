local lspconfig = require"lspconfig"

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename=${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}",
  formatStdin = true
}

lspconfig.efm.setup {
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/", "package.json" },
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      typescript = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  }
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,
      import_all_timeout = 5000,
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      update_imports_on_move = true,
      require_confirmation_on_move = true,
    }

    ts_utils.setup_client(client)
  end,
}

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json"
        }
      }
    }
  }
}
