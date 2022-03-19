local lsp_installer = require("nvim-lsp-installer")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

local extend_options = {
  ["cssls"] = require("lsp.server.cssls"),
  ["emmet_ls"] = require("lsp.server.emmet_ls"),
  ["gopls"] = require("lsp.server.gopls"),
  ["html"] = require("lsp.server.html"),
  ["jsonls"] = require("lsp.server.jsonls"),
  ["solidity_ls"] = require("lsp.server.solidity_ls"),
  ["tsserver"] = require("lsp.server.tsserver"),
  ["yamlls"] = require("lsp.server.yamlls"),
}

lsp_installer.on_server_ready(function(server)
  local options = extend_options[server.name](on_attach, capabilities)
  server:setup(options)
end)
