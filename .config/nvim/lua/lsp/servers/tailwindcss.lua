return function(on_attach, capabilities)
  require("lspconfig").tailwindcss.setup({
    filetypes = {
      "astro",
      "html",
      "css",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svg",
    },
    capabilities = capabilities,
    root_dir = function(fname)
      local util = require("lspconfig/util")
      return util.root_pattern("tailwind.config.js", "tailwind.config.mjs", "tailwind.config.cjs")(fname)
    end,
    on_attach = function(client, buf)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      on_attach(client, buf)
    end,
  })
end
