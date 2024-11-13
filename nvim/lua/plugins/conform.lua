return {
  "stevearc/conform.nvim",
  keys = {
    {
      "gf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
    },
  },
  opts = {
    formatters_by_ft = {
      css = { "prettierd" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      svelte = { "prettierd" },
      solidity = { "prettierd" },
      svg = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      yaml = { "prettierd" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
