return {
  "williamboman/mason.nvim",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        local icons = require("icons")
        require("mason").setup({
          ui = {
            icons = {
              package_installed = icons.Success,
              package_uninstalled = icons.Failure,
              package_pending = icons.Pending,
            },
          },
        })
        require("mason-lspconfig").setup({
          ensure_installed = { "cssls", "dockerls", "html", "jsonls", "tsserver", "volar" },
        })

        require("mason-null-ls").setup({
          ensure_installed = { "eslint_d", "prettierd", "stylua" },
        })
      end,
    },
    "jayp0521/mason-null-ls.nvim",
  },
}
