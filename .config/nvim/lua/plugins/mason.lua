require("mason").setup()
local config = require("plugins.config")
local packages = vim.list_extend(vim.tbl_keys(config.lsps), config.formatters)
local registry = require("mason-registry")
registry.refresh(function()
	for _, package_name in ipairs(packages) do
		local package = registry.get_package(package_name)
		if package and not package:is_installed() then
			package:install()
		end
	end
end)
