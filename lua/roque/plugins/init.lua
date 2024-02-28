return {
        {
                "nvim-tree/nvim-web-devicons",
                name = "web-devicons",
        },
       	{
		"nvim-lua/plenary.nvim",
		name = "plenary"
	},
	{
	        "nvim-treesitter/nvim-treesitter",
	        build = ":TSUpdate",
	},
        {
                'windwp/nvim-autopairs',
                event = "InsertEnter",
                config = true,
        },
        
}
