local lsp_installer = require("nvim-lsp-installer")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on_attach")

local servers = {
  "cssls",
  "dockerls",
  "emmet_ls",
  "gopls",
  "jsonls",
  "pyright",
  "solidity_ls",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

local extend_options = {
  ["cssls"] = require("lsp.server.cssls"),
  ["dockerls"] = require("lsp.server.dockerls"),
  ["emmet_ls"] = require("lsp.server.emmet_ls"),
  ["gopls"] = require("lsp.server.gopls"),
  ["html"] = require("lsp.server.html"),
  ["jsonls"] = require("lsp.server.jsonls"),
  ["pyright"] = require("lsp.server.pyright"),
  ["solidity_ls"] = require("lsp.server.solidity_ls"),
  ["sumneko_lua"] = require("lsp.server.sumneko_lua"),
  ["tsserver"] = require("lsp.server.tsserver"),
  ["tailwindcss"] = require("lsp.server.tailwindcss"),
  ["yamlls"] = require("lsp.server.yamlls"),
}

lsp_installer.on_server_ready(function(server)
  local options = extend_options[server.name](on_attach, capabilities)
  server:setup(options)
end)
