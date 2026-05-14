return {
  {
    "nvim-mini/mini.icons",
    opts = {},
    config = function()
      require("mini.icons").mock_nvim_web_devicons()
    end,
  },
  { "nvim-mini/mini.pairs", opts = {} },
}
