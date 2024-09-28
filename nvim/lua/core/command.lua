vim.api.nvim_create_user_command("InstallAll", function()
  local npm_packages = {
    ["@fsouza/prettierd"] = "prettierd",
    ["@nomicfoundation/solidity-language-server"] = "nomicfoundation-solidity-language-server",
    ["@tailwindcss/language-server"] = "tailwindcss-language-server",
    ["tact-extracted-ls"] = "tact-extracted-ls",
  }

  local brew_packages = {
    ripgrep = "ripgrep",
    stylua = "stylua",
    ["lua-language-server"] = "lua-language-server",
  }

  for name, bin in pairs(npm_packages) do
    if vim.fn.executable(bin) == 0 then
      print("Installing " .. name)
      vim.fn.system("npm i -g " .. name)
    end
  end

  for name, bin in pairs(brew_packages) do
    if vim.fn.executable(bin) == 0 then
      print("Installing " .. name)
      vim.fn.system("brew install " .. name)
    end
  end

  print("All packages are installed!")
end, {})
