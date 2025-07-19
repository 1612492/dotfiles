local lsps = {
  ["css-lsp"] = "cssls",
  ["json-lsp"] = "jsonls",
  ["html-lsp"] = "html",
  ["tailwindcss-language-server"] = "tailwindcss",
  ["vscode-solidity-server"] = "solidity_ls",
  vtsls = "vtsls",
}

local formatters = {
  "prettierd",
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
        vim.lsp.config("vtsls", {
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
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

    vim.lsp.enable(vim.tbl_values(lsps))
  end,
}
