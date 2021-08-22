require('nvim-autopairs').setup()
require('colorizer').setup()
require("nvim_comment").setup({
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
