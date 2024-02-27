return {
        'nvim-lualine/lualine.nvim',
        dependencies = {
                'web-devicons',
        },


        config = function()
                require('lualine').setup({
                        options = {
                                theme = 'gruvbox'
                        }
                }) 
        end      
}
