return function(on_attach, capabilities)
  require("lspconfig").astro.setup({
    capabilities = capabilities,
    root_dir = function(fname)
      local util = require("lspconfig/util")
      return util.root_pattern("astro.config.js", "astro.config.mjs", "tailwind.config.cjs")(fname)
    end,
    on_attach = function(client, buf)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      on_attach(client, buf)
    end,
  })
end
