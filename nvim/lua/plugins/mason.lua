return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  opts = {
    core = {
      ui = {
        border = "rounded",
        width = 0.8,
        height = 0.8,
      },
    },
    packages = {
      "astro-language-server",
      "css-lsp",
      "dockerfile-language-server",
      "gopls",
      "html-lsp",
      "json-lsp",
      "lua-language-server",
      "nomicfoundation-solidity-language-server",
      "rust-analyzer",
      "svelte-language-server",
      "tailwindcss-language-server",
      "prettierd",
      "stylua",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts.core)
    local registry = require("mason-registry")

    registry.refresh(function()
      for _, p in ipairs(opts.packages) do
        local package = registry.get_package(p)
        if not package:is_installed() then
          package:install()
        end
      end
    end)
  end,
}
