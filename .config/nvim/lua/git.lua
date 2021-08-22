require('gitsigns').setup()
require('diffview').setup()
require('neogit').setup {
  signs = {
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true  
  },
}
