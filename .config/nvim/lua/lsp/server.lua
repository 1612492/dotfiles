local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client, buf, disableFormatting)
  local enable = client.name == "null-ls"

  client.server_capabilities.documentFormattingProvider = enable
  client.server_capabilities.documentRangeFormattingProvider = enable

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = buf }

  vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  keymap("n", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({float = {border = 'rounded'}})<cr>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({float = {border = 'rounded'}})<cr>", opts)
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end

local nls = require("null-ls")
local lspconfig = require("lspconfig")

local servers = {
  cssls = {
    settings = {
      css = {
        lint = { validProperties = { "composes" } },
      },
    },
  },
  dartls = {},
  dockerls = {},
  html = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
  },
  nls = {
    sources = {
      nls.builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.json", ".eslintrc.js" })
        end,
      }),
      nls.builtins.formatting.prettierd.with({
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/.prettierrc.json",
        },
      }),
      nls.builtins.formatting.stylua.with({
        extra_args = { "--config-path", vim.fn.stdpath("config") .. "/stylua.toml" },
      }),
    },
  },
  tsserver = {
    init_options = {
      plugins = {
        { name = "typescript-styled-plugin" },
        { name = "typescript-plugin-css-modules" },
      },
    },
    on_attach = function(client, buf)
      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({
        auto_inlay_hints = false,
      })
      ts_utils.setup_client(client)

      on_attach(client, buf)
    end,
  },
  volar = {},
}

local default_option = {
  on_attach = on_attach,
  capabilities = capabilities,
}

for server, option in pairs(servers) do
  option = vim.tbl_deep_extend("force", {}, default_option, option or {})
  if server == "nls" then
    nls.setup(option)
  else
    require("lspconfig")[server].setup(option)
  end
end
