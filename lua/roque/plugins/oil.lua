return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			win_options = {
				wrap = false,
			},
			columns = {
				"icon",
				"size",
			},
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
				-- This function defines what is considered a "hidden" file
				is_hidden_file = function(name, bufnr)
					local m = name:match("^%.")
					return m ~= nil
				end,
				-- This function defines what will never be shown, even when `show_hidden` is set
				is_always_hidden = function(name, bufnr)
					return false
				end,
				-- Sort file names with numbers in a more intuitive order for humans.
				-- Can be "fast", true, or false. "fast" will turn it off for large directories.
				natural_order = "fast",
				-- Sort file and directory names case insensitive
				case_insensitive = false,
				sort = {
					-- sort order can be "asc" or "desc"
					-- see :help oil-columns to see which columns are sortable
					{ "type", "asc" },
					{ "name", "asc" },
				},
				-- Customize the highlight group for the file name
				highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
					return nil
				end,
			},
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = function()
					local oil = require("oil")
					local entry = oil.get_cursor_entry()
					if not entry then return end
					if entry.type == "directory" then
						oil.select()
						return
					end
					local dir = oil.get_current_dir()
					local filepath = dir .. entry.name
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].filetype ~= "oil" then
							vim.api.nvim_set_current_win(win)
							vim.cmd("edit " .. vim.fn.fnameescape(filepath))
							return
						end
					end
					vim.cmd("vsplit " .. vim.fn.fnameescape(filepath))
				end,
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["q"] = { "actions.close", mode = "n" },
				["<C-l>"] = "actions.refresh",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
		},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
}
