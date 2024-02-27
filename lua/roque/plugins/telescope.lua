return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"plenary"
	},

        config = function()
                require('telescope').setup({})
                
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
                vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
        end
}
