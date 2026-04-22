vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<space>pv", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>o", function()
	local oil = require("oil")
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "oil" then
			vim.api.nvim_win_close(win, true)
			return
		end
	end
	vim.cmd("topleft vsplit")
	vim.cmd("vertical resize 35")
	oil.open()
end, { desc = "Toggle Oil sidebar" })
vim.keymap.set("n", "<leader>G", ":LazyGit<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader><Tab>", "<C-6>", { desc = "Switch to previous tab" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Buffer Navigation
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Move next buffer" })
vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Move to revious buffer" })
