local lsps = {
  ["css-lsp"] = "cssls",
  ["html-lsp"] = "html",
  ["tailwindcss-language-server"] = "tailwindcss",
  ["vtsls"] = "vtsls",
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
  config = function()
    require("mason").setup()

    local packages = vim.list_extend(vim.tbl_keys(lsps), formatters)
    ensure_installed(packages)

    vim.lsp.enable(vim.tbl_values(lsps))
  end,
}
