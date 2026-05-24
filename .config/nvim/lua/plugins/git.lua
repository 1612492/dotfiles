local gitsigns = require("gitsigns")
gitsigns.setup({
	on_attach = function(buffer)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = buffer
			vim.keymap.set(mode, l, r, opts)
		end
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)
		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)
		map("n", "<leader>ha", gitsigns.reset_buffer)
		map("n", "<leader>hr", gitsigns.reset_hunk)
		map("n", "<leader>hb", gitsigns.blame_line)
	end,
})
