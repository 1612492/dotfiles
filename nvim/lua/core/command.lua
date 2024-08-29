vim.api.nvim_create_user_command("MasonInstallAll", function()
  local ensure_installed = {
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "nomicfoundation-solidity-language-server",
    "tailwindcss-language-server",
    "vtsls",
    "prettierd",
    "stylua",
  }

  require("mason.ui").open()
  require("mason-registry").refresh(function()
    for _, tool in ipairs(ensure_installed) do
      local pkg = require("mason-registry").get_package(tool)
      if not pkg:is_installed() then
        pkg:install()
      end
    end
  end)
end, {})
