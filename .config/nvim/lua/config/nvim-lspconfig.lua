return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    "nvim-lua/plenary.nvim",
    "b0o/schemastore.nvim",
    require("config.mason"),
  },
  config = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"
    require("lsp.signs")
    require("lsp.handlers")
    require("lsp.installer")
    require("lsp.server")
  end,
}
