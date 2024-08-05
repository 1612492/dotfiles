return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function()
    return {
      border = "rounded",
      sources = {
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs" })
          end,
        }),
        require("none-ls.code_actions.eslint_d"),
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.formatting.stylua,
      },
    }
  end,
}
