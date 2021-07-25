local lspconfig = require"lspconfig"

local formatFiletypes = {
  javascript = "eslint",
  javascriptreact = "eslint",
  typescript = "eslint",
  typescriptreact = "eslint",
  ["javascript.jsx"] = "eslint",
  ["typescript.tsx"] = "eslint",
}

local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.js", ".eslintrc.json", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}

local formatters = {
  eslint = {command = "eslint_d", args = {"--stdin", "--fix-to-stdout", "--stdin-filename" ,"%filepath"}}
}

lspconfig.diagnosticls.setup {
  filetypes = vim.tbl_keys(formatFiletypes),
  init_options = {
    filetypes = formatFiletypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes
  }
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup {}
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
          fileMatch = { "tsconfig.json" },
          url = "https://json.schemastore.org/tsconfig.json"
        }
      }
    }
  }
}
