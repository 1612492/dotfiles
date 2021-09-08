local utils = {}
local fn = vim.fn
local package_directory = fn.stdpath('data')..'/site/pack/packer/start/'

function utils.is_valid(package_name)
  local package_path = package_directory..package_name

  if fn.empty(fn.glob(package_path)) > 0 then
    return false
  end

  return true
end

return utils
