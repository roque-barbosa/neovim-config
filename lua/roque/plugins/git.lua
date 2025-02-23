return {
	"tpope/vim-fugitive",
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
