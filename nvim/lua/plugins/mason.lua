return {
  "mason-org/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "html",
        "jsonls",
        "lua_ls",
        "tailwindcss",
        "vtsls",
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettierd",
        "stylua",
      },
    })
  end,
}
