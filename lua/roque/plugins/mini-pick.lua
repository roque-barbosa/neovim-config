return {
	{
		"echasnovski/mini.pick",
		version = false,
		config = function()
			local pick = require("mini.pick")
			local extra = require("mini.extra")
			pick.setup({
				mappings = {
					scroll_down = "d",
					scroll_up = "u",
				},
				window = {
					config = function()
						return {
							anchor = "NW",
							row = vim.o.lines - vim.o.cmdheight - 2,
							col = 0,
							width = vim.o.columns,
							height = math.floor(vim.o.lines * 0.35),
						}
					end,
				},
			})
			extra.setup()

			vim.keymap.set("n", "<leader><leader>", function()
				pick.builtin.buffers({}, {
					mappings = {
						delete_buffer = {
							char = "<C-d>",
							func = function()
								local current = pick.get_picker_matches().current
								if not current then return end
								local bufnr = type(current) == "table" and current.bufnr or vim.fn.bufnr(current)
								if not bufnr or bufnr == -1 then return end
								vim.api.nvim_buf_delete(bufnr, { force = false })
								local items = pick.get_picker_items() or {}
								local new_items = vim.tbl_filter(function(item)
									local bnr = type(item) == "table" and item.bufnr or vim.fn.bufnr(item)
									return bnr ~= bufnr
								end, items)
								pick.set_picker_items(new_items)
							end,
						},
					},
				})
			end, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>ff", pick.builtin.files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fw", pick.builtin.grep_live, { desc = "[F]ind [W]ord (grep)" })
			vim.keymap.set("n", "<leader>/", function()
				extra.pickers.buf_lines({ scope = "current" })
			end, { desc = "[/] Search in current buffer" })
		end,
	},
	{ "echasnovski/mini.extra", version = false },
}
