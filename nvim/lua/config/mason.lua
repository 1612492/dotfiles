return function()
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

  require("mason-nvim-dap").setup({
    automatic_installation = true,
    ensure_installed = { "delve" },
    handlers = {
      function(config)
        require("mason-nvim-dap").default_setup(config)
      end,
    },
  })
end
