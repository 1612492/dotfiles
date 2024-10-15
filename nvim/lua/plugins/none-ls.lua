return {
  "nvimtools/none-ls.nvim",
  dependencies = "nvimtools/none-ls-extras.nvim",
  opts = function()
    return {
      sources = {
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({ "eslint.config.js" })
          end,
        }),
        require("none-ls.code_actions.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({ "eslint.config.js" })
          end,
        }),
      },
    }
  end,
}
