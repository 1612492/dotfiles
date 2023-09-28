local icon = require("icon")

return function()
  require("gitsigns").setup({
    signs = {
      add = { text = icon.git_add },
      change = { text = icon.git_change },
      delete = { text = icon.git_delete },
      topdelete = { text = icon.git_topdelete },
      changedelete = { text = icon.git_changedelete },
      untracked = { text = icon.git_untracked },
    },
  })
end
