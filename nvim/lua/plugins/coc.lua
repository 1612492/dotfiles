return {
  "neoclide/coc.nvim",
  branch = "release",
  init = function()
    vim.g.coc_global_extensions = {
      "@nomicfoundation/coc-solidity",
      "@yaegassy/coc-tailwindcss3",
      "coc-css",
      "coc-html",
      "coc-json",
      "coc-lua",
      "coc-snippets",
      "coc-tsserver",
      "https://github.com/rafamadriz/friendly-snippets@main",
    }

    local map = vim.keymap.set
    local opts = { silent = true }

    map("n", "gR", "<Plug>(coc-rename)", opts)
    map("n", "gd", "<Plug>(coc-definition)", opts)
    map("n", "gy", "<Plug>(coc-type-definition)", opts)
    map("n", "gi", "<Plug>(coc-implementation)", opts)
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
