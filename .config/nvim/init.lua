pcall(require, "impatient")
local compiled, _ = pcall(require, "packer_compiled")

if not compiled then
  require("packer_init")
end

require("option")
require("plugin")
require("lsp")
