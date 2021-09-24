local existed, _ = pcall(require, "nvim-treesitter")

if not existed then
  return
end

require("nvim-treesitter.configs").setup({
  autopairs = {enable = true},
  autotag = {enable = true},
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      }
    }
  },
  ensure_installed = "maintained",
  indent = {enable = true},
  highlight = {enable = true},
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    }
  }
})
