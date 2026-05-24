vim.keymap.set({ "n", "v" }, "Y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves lines up in visual selection" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

local function copy_to_clipboard(text, message)
	vim.fn.setreg("+", text)
	vim.notify(message, vim.log.levels.INFO)
end

vim.keymap.set("n", "<leader>af", function()
	local path = vim.fn.expand("%:.")
	copy_to_clipboard(path, "Copied: " .. path)
end, { desc = "Copy file path" })

vim.keymap.set("n", "<leader>aF", function()
	local path = vim.fn.expand("%:p")
	copy_to_clipboard(path, "Copied: " .. path)
end, { desc = "Copy full file path" })

vim.keymap.set("v", "<leader>av", function()
	local path = vim.fn.expand("%:.")
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	local formatted = string.format("%s:%d-%d", path, start_line, end_line)
	copy_to_clipboard(formatted, "Copied: " .. formatted)
end, { desc = "Copy file path with range" })

vim.keymap.set("n", "<leader>f", function()
	Snacks.picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>g", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>b", function()
	Snacks.picker.buffers()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>e", function()
	require("oil").open()
end, { desc = "Explorer" })

vim.keymap.set("n", "gf", function()
	require("conform").format()
end, { desc = "Format" })

for i = 1, 9 do
	vim.keymap.set(
		"n",
		("<leader>%s"):format(i),
		("<cmd>BufferGoto %s<cr>"):format(i),
		{ desc = ("Goto buffer %s"):format(i) }
	)
end

vim.keymap.set("n", "<leader>0", "<cmd>BufferPick<cr>", { desc = "Pick a buffer" })
vim.keymap.set("n", "<leader>-", "<cmd>BufferClose<cr>", { desc = "Close a buffer" })
vim.keymap.set("n", "<leader>=", "<cmd>BufferCloseAllButCurrent<cr>", { desc = "Close all buffer but currrent" })
