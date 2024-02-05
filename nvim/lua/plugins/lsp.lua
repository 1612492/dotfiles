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
    require("neodev").setup()

    local handlers = vim.lsp.handlers

    vim.diagnostic.config(opts.diagnostic)
    handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, { border = "rounded" })
    handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, { border = "rounded" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local function map(mode, l, r)
          local opts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set(mode, l, r, opts)
        end

        map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action)
        map("n", "gR", vim.lsp.buf.rename)
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gt", vim.lsp.buf.type_definition)
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "gr", vim.lsp.buf.references)

        map("n", "<C-k>", vim.lsp.buf.signature_help)
        map("n", "K", vim.lsp.buf.hover)

        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
      end,
    })


    for name, icon in pairs(opts.signs) do
      vim.fn.sign_define(name, { text = icon, texthl = name })
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for name, config in pairs(opts.servers) do
      local extended_config = vim.tbl_extend("force", {
        capabilities = capabilities,
      }, config)

      require("lspconfig")[name].setup(extended_config)
    end
  end,
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
    { "pmizio/typescript-tools.nvim", opts = {} },
  },
}
