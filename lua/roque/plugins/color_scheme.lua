return {
  {
    "folke/tokyonight.nvim",
    opts = {},
    config = function ()
      require("tokyonight").setup({
        -- use the night style
        style = "night",
        -- disable italic for functions
        styles = {
          functions = {}
        },
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        on_colors = function (colors)
         colors.bg = "#0C0C0C"
         colors.bg_dark = "#222831"
         colors.comment = "#7a8099"
         colors.green1 = "#B0EBB4"
         colors.blue1 = "#7BD3EA"
         colors.green = "#B5C18E"
--[[ bg = "#24283b",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  dark3 = "#545c7e",
  comment = "#565f89",
  dark5 = "#737aa2",
  blue0 = "#3d59a1",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  purple = "#9d7cd8",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  teal = "#1abc9c",
  red = "#f7768e",
  red1 = "#db4b4b", ]]
        end
      })
      vim.cmd("colorscheme tokyonight")
    end
  },
  --   {
  --     "catppuccin/nvim",
  --     name = "catppuccin",
  --     config = function ()
  --       require("catppuccin").setup({
  --         flavour = "mocha", -- latte, frappe, macchiato, mocha
  --         background = { -- :h background
  --         dark = "mocha",
  --       },
  --       color_overrides = {
  --         mocha = {
  --           base = "#000000",
  --           mantle = "#000000",
  --           crust = "#000000",
  --         },
  --       },
  --       integrations = {
  --         telescope = {
  --           enabled = true,
  --         },
  --         dropbar = {
  --           enabled = true,
  --           color_mode = true,
  --         },
  --       },
  --     })
  --     vim.cmd("colorscheme catppuccin")
  --   end
  -- },
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
}
