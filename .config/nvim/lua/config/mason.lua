function config()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_uninstalled = "✗",
        package_pending = "⟳",
      },
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "cssls",
      "dockerls",
      "html",
      "jsonls",
      "tsserver",
    },
  })
  require("mason-null-ls").setup({
    ensure_installed = {
      "eslint_d",
      "prettierd",
      "stylua",
    },
  })
end

return config
