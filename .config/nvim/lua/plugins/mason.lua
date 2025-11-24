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
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(event)
            local map = function(key, func)
              local opts = { noremap = true, silent = true, buffer = event.buf }
              vim.keymap.set("n", key, func, opts)
            end

            map("ga", vim.lsp.buf.code_action)
            map("gn", vim.lsp.buf.rename)
            map("gr", Snacks.picker.lsp_references)
            map("gi", Snacks.picker.lsp_implementations)
            map("gd", Snacks.picker.lsp_definitions)
            map("[d", vim.diagnostic.goto_prev)
            map("]d", vim.diagnostic.goto_next)
            map("K", vim.lsp.buf.hover)
          end,
        })

        vim.diagnostic.config({
          underline = false,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.INFO] = " ",
              [vim.diagnostic.severity.HINT] = " ",
            },
          },
        })

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
