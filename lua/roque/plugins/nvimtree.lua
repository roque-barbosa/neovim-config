return {
                'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
                require("nvim-tree").setup({
                        filters = {
                                dotfiles  = false,
                                git_clean = false,
                        }
                })

                vim.keymap.set('n', '<leader>pv', ':NvimTreeFocus<cr>', {})

        end
    }
