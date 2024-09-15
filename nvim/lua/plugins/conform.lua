local formatters = {
  prettierd = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "markdown",
    "svg",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  stylua = { "lua" },
}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "gf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
    },
  },
  opts = function()
    local opts = { formatters_by_ft = {} }

    for formatter, filetypes in pairs(formatters) do
      for _, filetype in ipairs(filetypes) do
        opts.formatters_by_ft[filetype] = { formatter }
      end
    end

    return opts
  end,
}
