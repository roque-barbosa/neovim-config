return {
  --[[ {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function ()
  require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
  dark = "mocha",
  },
  color_overrides = {
  mocha = {
  base = "#000000",
  mantle = "#000000",
  crust = "#000000",
  },
  },
  integrations = {
  telescope = {
  enabled = true,
  },
  dropbar = {
  enabled = true,
  color_mode = true,
  },
  },
  })
  vim.cmd("colorscheme catppuccin")
  end
  }, ]]
  --[[ {
  "ellisonleao/gruvbox.nvim",
  config = function ()
  require("gruvbox").setup({
  terminal_colors = false,
  palette_overrides = {
  dark0 = "#0f0f12", --sets the background
  }
  })
  vim.cmd("colorscheme gruvbox")
  end
  }, ]]
  --[[ {
  "Mofiqul/dracula.nvim",
  name = "dracula",
  config = function()
  require('dracula').setup({
  colors = {
  -- bg = '#000000',
  bg = "#0b0d0f",-- 
  fg = "#F8F8F2",
  blue = "#9580FF",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#FF9580",
  orange = "#FFB86C",
  yellow = "#FFFF80",
  green = "#8AFF80",
  purple = "#FF80BF",
  cyan = "#80FFEA",
  pink = "#FF79C6",
  bright_black = "#504C67",
  bright_red = "#FFAA99",
  bright_green = "#A2FF99",
  bright_yellow = "#FFFF99",
  bright_blue = "#AA99FF",
  bright_magenta = "#FF99CC",
  bright_cyan = "#99FFEE",
  bright_white = "#FFFFFF",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
  white = "#F8F8F2",
  black = "#191A21",
  },
  italic_comment = true,
  show_end_of_buffer = true,
  })
  vim.cmd("colorscheme dracula")
  end
  }, ]]
  {
    "scottmckendry/cyberdream.nvim",
    config = function ()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        borderless_telescope = true,
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- Example:
          bg = "#000000",
        },
      })
      vim.cmd("colorscheme cyberdream")
    end
  }
}
