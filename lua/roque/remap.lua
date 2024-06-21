vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<space>pv", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>G", ":LazyGit<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Go to previous Diagnostic message"})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Go to next Diagnostic message"})
vim.keymap.set("n", "<leader><Tab>", "<C-6>", {desc = "Switch to previous tab"})
