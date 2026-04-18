return {
  --[[ {
    "roque-barbosa/castelvanianigth.nvim",
    opts = {},
    config = function()
      require("tokyonight").setup({
        -- use the night style
        style = "castlevania",
        -- disable italic for functions
        styles = {
          functions = {},
        },
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
        on_highlights = function(hl, c)
        end,
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        on_colors = function(colors)
          colors.terminal_black="#708CA9"
          colors.bg_visual="#436474"
        end,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  }, ]]
  --[[ {
    "neanias/everforest-nvim",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("everforest").setup {
        background = "hard",
        transparent_background_level = 2,
        -- sign_column_background = "grey",
        -- ui_contrast = "high",
        float_style = "dim",
        on_highlights = function(hl, _)
          hl.LspInlayHint = { fg = "#6C7E8C", bold = true, ctermfg = 198, cterm = { bold = true } }
        end,
      }

      vim.cmd.colorscheme "everforest"
    end,
    lazy = false,
    priority = 1000,
  }, ]]
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({

        filter = "spectrum",
        inc_search = "underline",
        override = function()
          return {
            -- main editor
            Normal       = { bg = "#1e1e1e", fg = "#d4d4d4" },
            EndOfBuffer  = { bg = "#1e1e1e" },

            -- comments
            Comment      = { fg = "#9a9a9a", italic = true },

            -- UI contrast
            LineNr       = { fg = "#5a5a5a" },
            CursorLineNr = { fg = "#d4d4d4" },

            -- splits / borders
            VertSplit    = { fg = "#2d2d2d", bg = "#1e1e1e" },

            -- floating windows
            NormalFloat  = { bg = "#252526" },
            FloatBorder  = { fg = "#2d2d2d", bg = "#252526" },


            -- -- telescope links
            -- TelescopeNormal        = { link = "NormalFloat" },
            -- TelescopeBorder        = { link = "FloatBorder" },
            -- TelescopePromptNormal  = { link = "CursorLineNr" },
            -- TelescopePromptBorder  = { link = "FloatBorder" },
            -- TelescopePreviewNormal = { link = "Normal" },
          }
        end,
      })
      vim.cmd.colorscheme("monokai-pro")
    end,
  }
}
