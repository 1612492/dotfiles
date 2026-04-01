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

local function ensure_installed(packages)
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

local packages = vim.list_extend(vim.tbl_keys(lsps), formatters)
ensure_installed(packages)

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config"),
        },
      },
    },
  },
})

vim.lsp.enable(vim.tbl_values(lsps))

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  jump = {
    on_jump = function(diagnostic, bufnr)
      if not diagnostic then
        return
      end
      vim.diagnostic.show(diagnostic.namespace, bufnr, { diagnostic }, { virtual_lines = false, virtual_text = true })
    end,
  },
})
