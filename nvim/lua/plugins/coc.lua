return {
  "neoclide/coc.nvim",
  branch = "release",
  dependencies = {
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = { map_cr = false } },
  },
  init = function()
    vim.g.coc_global_extensions = {
      "coc-css",
      "coc-html",
      "coc-json",
      "coc-snippets",
      "coc-tsserver",
    }

    local map = vim.keymap.set
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

    map("i", "<CR>", function()
      if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
      else
        return require("nvim-autopairs").autopairs_cr()
      end
    end, opts)

    opts = { silent = true }
    map("n", "grr", "<Plug>(coc-rename)", opts)
    map("n", "gd", "<Plug>(coc-definition)", opts)
    map("n", "gr", "<Plug>(coc-references)", opts)
    map("n", "[d", "<Plug>(coc-diagnostic-prev)", opts)
    map("n", "]d", "<Plug>(coc-diagnostic-next)", opts)
    map("n", "K", function()
      local cw = vim.fn.expand("<cword>")
      if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command("h " .. cw)
      elseif vim.api.nvim_eval("coc#rpc#ready()") then
        vim.fn.CocActionAsync("doHover")
      else
        vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
      end
    end, opts)

    opts = { silent = true, nowait = true }
    map("n", "<leader>a", "<Plug>(coc-codeaction-cursor)", opts)
    map("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
  end,
}
