function config()
  require("mason").setup()

  require("mason-lspconfig").setup({
    ensure_installed = {
      "astro",
      "cssls",
      "dockerls",
      "html",
      "jsonls",
      "tailwindcss",
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
