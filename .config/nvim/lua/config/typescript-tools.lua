return function()
  require("typescript-tools").setup({
    settings = {
      tsserver_plugins = {},
    },
  })
end
