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
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },
  {
    'NvChad/nvim-colorizer.lua',
    name = "colorizer",
    config = function()
      require('colorizer').setup()
    end
  },
  { 'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true }
  },
}
