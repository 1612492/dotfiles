return function()
  require("mason").setup({
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.8,
    },
  })


  local registry = require("mason-registry")

  local servers = {
    "astro-language-server",
    "css-lsp",
    "dockerfile-language-server",
    "gopls",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "nomicfoundation-solidity-language-server",
    "tailwindcss-language-server",
    "eslint_d",
    "prettierd",
    "stylua"
  }

  registry.refresh(function()
    for _, p in ipairs(servers) do
      local package = registry.get_package(p)
      if not package:is_installed() then
        package:install()
      end
    end
  end)
end
