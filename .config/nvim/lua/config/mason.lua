return function()
  require("mason").setup({
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.8,
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "astro",
      "cssls",
      "dockerls",
      "html",
      "jsonls",
      "solidity_ls_nomicfoundation",
      "tailwindcss",
    },
  })

  require("mason-null-ls").setup({
    ensure_installed = {
      "prettierd",
      "stylua",
    },
  })
end
