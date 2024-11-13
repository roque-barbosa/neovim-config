return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				sort = {
					sorter = "case_sensitive",
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				view = {
					adaptive_size = false,
					width = 60,
					float = {
						enable = false,
						quit_on_focus_loss = true,
						open_win_config = {
							relative = "editor",
							border = "rounded",
							width = 60,
							height = 60,
							row = 1,
							col = 1,
						},
					},
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			})
		end,
	},
}
