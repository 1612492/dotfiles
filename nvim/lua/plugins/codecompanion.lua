return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = { adapter = "gemini" },
      inline = { adapter = "gemini" },
      agent = { adapter = "gemini" },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          api_key = function()
            return os.getenv("GEMINI_API_KEY")
          end,
        })
      end,
    },
  },
}
