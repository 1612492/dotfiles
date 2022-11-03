pcall(require, "impatient")
require("autocmd")
require("option")
require("plugin")

local compiled, _ = pcall(require, "plugin_compiled")

if not compiled then
  vim.cmd("PackerSync")
end

require("lsp")
require("keymapping")
