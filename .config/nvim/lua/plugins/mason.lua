local lsps = {
  ["astro-language-server"] = "astro",
  ["css-lsp"] = "cssls",
  ["html-lsp"] = "html",
  ["json-lsp"] = "jsonls",
  ["lua-language-server"] = "lua_ls",
  ["rust-analyzer"] = "rust_analyzer",
  ["svelte-language-server"] = "svelte",
  ["tailwindcss-language-server"] = "tailwindcss",
  ["vscode-solidity-server"] = "solidity_ls",
  gopls = "gopls",
  templ = "templ",
  tsgo = "tsgo",
}

local formatters = {
  "prettier",
  "stylua",
}

local ensure_installed = function(packages)
  local registry = require("mason-registry")
  registry.refresh(function()
    for _, package_name in ipairs(packages) do
      local package = registry.get_package(package_name)
      if package and not package:is_installed() then
        package:install()
      end
    end
  end)
end

return {
  "mason-org/mason.nvim",
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.diagnostic.config({
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.INFO] = " ",
              [vim.diagnostic.severity.HINT] = " ",
            },
          },
        })
      end,
    },
  },
  config = function()
    require("mason").setup()

    local packages = vim.list_extend(vim.tbl_keys(lsps), formatters)
    ensure_installed(packages)

    require("lsp.jsonls")
    require("lsp.lua_ls")
    vim.lsp.enable(vim.tbl_values(lsps))
  end,
}
