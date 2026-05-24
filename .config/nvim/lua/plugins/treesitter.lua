local config = require("plugins.config")

require("nvim-treesitter").install(config.treesitter_parsers)
