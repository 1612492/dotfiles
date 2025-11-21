return {
  "stevearc/conform.nvim",
  keys = {
    {
      "gf",
      function()
        require("conform").format()
      end,
    },
  },
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      ["_"] = { "trim_whitespace" },
      astro = { "prettierd" },
      css = { "prettierd" },
      go = { "gofmt" },
      graphql = { "prettierd" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      rust = { "rustfmt" },
      solidity = { "prettierd" },
      svelte = { "prettierd" },
      svg = { "prettierd" },
      templ = { "templ" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      yaml = { "prettierd" },
    },
  },
}
