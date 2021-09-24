pcall(require, "impatient")
local compiled, _ = pcall(require, "packer_compiled")

if not compiled then
  require("setup")
end

require("setting")
require("config")
