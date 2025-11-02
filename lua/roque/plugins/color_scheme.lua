return {
  --[[ {
		"folke/tokyonight.nvim",
		opts = {},
		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "night",
				-- disable italic for functions
				styles = {
					functions = {},
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
				on_colors = function(colors)
					-- colors.bg_dark = "#2c2c29"
					colors.bg = colors.bg_dark
					-- colors.bg = "#292c33"
					-- colors.blue = "#7BD3EA"
				end,
			})
			vim.cmd("colorscheme tokyonight")
		end,
	}, ]]

  -- {
  -- 	"catppuccin/nvim",
  -- 	name = "catppuccin",
  -- 	config = function()
  -- 		require("catppuccin").setup({
  -- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
  -- 			background = { -- :h background
  -- 				dark = "mocha",
  -- 			},
  -- 			color_overrides = {
  -- 				mocha = {
  -- 					base = "#0b0d0f",
  -- 					mantle = "#0b0d0f",
  -- 					crust = "#0b0d0f",
  -- 				},
  -- 			},
  -- 			integrations = {
  -- 				telescope = {
  -- 					enabled = true,
  -- 				},
  -- 				dropbar = {
  -- 					enabled = true,
  -- 					color_mode = true,
  -- 				},
  -- 			},
  -- 		})
  -- 		vim.cmd("colorscheme catppuccin")
  -- 	end,
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
                        require("dracula").setup({
                          colors = {
                            -- bg = '#000000',
                            bg = "#0b0d0f", --
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
                      end,
                    }, ]]
  -- {
  --   "rebelot/kanagawa.nvim",
  --   name = "kanagawa",
  --   config = function()
  --     -- Default options:
  --     require('kanagawa').setup({
  --       compile = false,  -- enable compiling the colorscheme
  --       undercurl = true, -- enable undercurls
  --       commentStyle = { italic = true },
  --       functionStyle = {},
  --       keywordStyle = { italic = true },
  --       statementStyle = { bold = true },
  --       typeStyle = {},
  --       transparent = false,   -- do not set background color
  --       dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  --       terminalColors = true, -- define vim.g.terminal_color_{0,17}
  --       colors = {             -- add/modify theme and palette colors
  --         palette = {
  --           -- Core mapping: Dracula Pro Van Helsing → Kanagawa keys
  --           fujiWhite     = "#F8F8F2", -- text
  --           oldWhite      = "#F8F8F2",
  --           sumiInk0      = "#0B0D0F",
  --           sumiInk1      = "#0A0D10",
  --           sumiInk2      = "#131A20",
  --           sumiInk3      = "#263340",
  --           sumiInk4      = "#414D58",
  --           waveBlue1     = "#263340",
  --           waveBlue2     = "#414D58",
  --           fujiGray      = "#708CA9", -- comments
  --           springViolet1 = "#9580FF", -- purple
  --           oniViolet     = "#FF80BF", -- pink
  --           waveRed       = "#FF9580", -- red
  --           surimiOrange  = "#FFCA80", -- orange
  --           carpYellow    = "#FFFF80", -- yellow
  --           springGreen   = "#8AFF80", -- green
  --           waveAqua1     = "#80FFEA", -- cyan
  --           waveAqua2     = "#8BE9FE", -- light cyan
  --           samuraiRed    = "#FF9580",
  --           roninYellow   = "#FFFF80",
  --           autumnGreen   = "#8AFF80",
  --           autumnYellow  = "#FFCA80",
  --           autumnRed     = "#FF9580",
  --
  --           -- Extra Kanagawa keys used for types and accents (remap to cyan)
  --           crystalBlue   = "#80FFEA",
  --           boatYellow2   = "#80FFEA",
  --           springViolet2 = "#80FFEA",
  --           waveBlue3     = "#80FFEA",
  --         },
  --         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  --       },
  --       overrides = function(colors)
  --         local p = colors.palette
  --         return {
  --           -- Base UI
  --           Normal                   = { fg = p.fujiWhite, bg = p.sumiInk1 },
  --           Comment                  = { fg = p.fujiGray, italic = true },
  --
  --           -- 🔹 Keywords
  --           Keyword                  = { fg = p.oniViolet, italic = true },
  --           Statement                = { fg = p.oniViolet, bold = true },
  --           Conditional              = { fg = p.oniViolet },
  --           Repeat                   = { fg = p.oniViolet },
  --           Label                    = { fg = p.oniViolet },
  --           Operator                 = { fg = p.oniViolet },
  --           Exception                = { fg = p.waveRed },
  --           ["@keyword"]             = { fg = p.oniViolet },
  --           ["@keyword.import"]      = { fg = p.oniViolet },
  --           ["@keyword.export"]      = { fg = p.oniViolet },
  --           ["@keyword.from"]        = { fg = p.oniViolet },
  --           ["@keyword.return"]      = { fg = p.oniViolet },
  --           ["@keyword.operator"]    = { fg = p.oniViolet },
  --           ["@keyword.function"]    = { fg = p.oniViolet },
  --           ["@keyword.modifier"]    = { fg = p.oniViolet },
  --           ["@keyword.declaration"] = { fg = p.oniViolet },
  --           ["@keyword.storage"]     = { fg = p.oniViolet },
  --
  --           -- 🔹 Types
  --           Type                     = { fg = p.waveAqua1, italic = true },
  --           StorageClass             = { fg = p.waveAqua1 },
  --           Structure                = { fg = p.waveAqua1 },
  --           Typedef                  = { fg = p.waveAqua1 },
  --           ["@type"]                = { fg = p.waveAqua1 },
  --           ["@type.builtin"]        = { fg = p.waveAqua1 },
  --           ["@type.definition"]     = { fg = p.waveAqua1 },
  --           ["@type.qualifier"]      = { fg = p.waveAqua1 },
  --
  --           -- 🔸 Functions
  --           Function                 = { fg = p.springGreen }, -- Vim legacy
  --           ["@function"]            = { fg = p.springGreen },
  --           ["@function.call"]       = { fg = p.springGreen },
  --           ["@function.builtin"]    = { fg = p.springGreen },
  --           ["@function.method"]     = { fg = p.springGreen },
  --           ["@method"]              = { fg = p.springGreen },
  --           ["@function.name"]       = { fg = p.springGreen },
  --           ["@function.identifier"] = { fg = p.springGreen },
  --           ["@fun"]                 = { fg = p.springGreen }, -- catch-all for some parsers
  --
  --           -- 🔸 Function properties / object methods
  --           ["@field"]               = { fg = p.surimiOrange },
  --           ["@property"]            = { fg = p.surimiOrange },
  --           ["@variable.member"]     = { fg = p.surimiOrange },
  --
  --           -- 🔹 Variables
  --           Identifier               = { fg = p.fujiWhite },
  --           ["@variable"]            = { fg = p.fujiWhite },
  --           ["@constant"]            = { fg = p.fujiWhite }, -- const/let/var bindings as white
  --           ["@variable.builtin"]    = { fg = p.fujiWhite }, -- e.g., useState destructured
  --           ["@variable.special"]    = { fg = p.fujiWhite }, -- parser-specific special variables
  --           ["@symbol"]              = { fg = p.fujiWhite }, -- fallback for symbols
  --
  --           -- 🔹 Constants / literals
  --           Constant                 = { fg = p.fujiWhite }, -- literal constants
  --           String                   = { fg = p.carpYellow },
  --
  --           -- Numbers & booleans → orange
  --           Number                   = { fg = p.surimiOrange },
  --           ["@number"]              = { fg = p.surimiOrange },
  --           Float                    = { fg = p.surimiOrange },
  --           ["@float"]               = { fg = p.surimiOrange },
  --           Boolean                  = { fg = p.surimiOrange },
  --           ["@boolean"]             = { fg = p.surimiOrange },
  --
  --           -- 🔹 HTML / JSX tags
  --           Tag                      = { fg = p.oniViolet },   -- fallback Vim highlight
  --           ["@tag"]                 = { fg = p.oniViolet },   -- lowercase HTML tags
  --           ["@tag.delimiter"]       = { fg = p.oniViolet },   -- < and >
  --           ["@tag.attribute"]       = { fg = p.springGreen }, -- HTML/JSX attributes
  --           htmlTagName              = { fg = p.oniViolet },   -- fallback for HTML tags
  --           ["@constructor"]         = { fg = p.waveAqua1 },   -- React / JSX components
  --           ["@jsx.component"]       = { fg = p.waveAqua1 },   -- JSX components
  --           ["@jsx.tag"]             = { fg = p.oniViolet },   -- lowercase JSX tag
  --           ["@jsx.attr"]            = { fg = p.springGreen }, -- JSX attributes
  --
  --           -- Diagnostics
  --           DiagnosticError          = { fg = p.waveRed },
  --           DiagnosticWarn           = { fg = p.roninYellow },
  --           DiagnosticInfo           = { fg = p.waveAqua1 },
  --           DiagnosticHint           = { fg = p.springGreen },
  --
  --           -- UI
  --           DiffAdd                  = { bg = "#8AFF80" },
  --           DiffChange               = { bg = "#FFCA80" },
  --           DiffDelete               = { bg = "#FF9580" },
  --         }
  --       end,
  --       theme = "wave",    -- Load "wave" theme
  --       background = {     -- map the value of 'background' option to a theme
  --         dark = "dragon", -- try "dragon" !
  --         light = "lotus"
  --       },
  --     })
  --
  --     -- setup must be called before loading
  --     vim.cmd("colorscheme kanagawa")
  --   end,
  -- },
  {
    "roque-barbosa/dracu-kanagawa.nvim",
    name = "dracu-kanagawa",
    -- dir = "/Users/roquebarbosa/Documents/Study/nvim/dracu-kanagawa.nvim",

    config = function()
      -- Default options:
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "draco",  -- Load "wave" theme
        background = {     -- map the value of 'background' option to a theme
          dark = "draco", -- try "dragon" !
          light = "lotus"
        },
      })

      -- setup must be called before loading
      vim.cmd("colorscheme kanagawa")
    end,
  },
  -- {
  -- 	"sainnhe/sonokai",
  -- 	lazy = false,
  -- 	priority = 1000,
  -- 	style = "atlantis",
  -- 	config = function()
  -- 		-- Optionally configure and load the colorscheme
  -- 		-- directly inside the plugin declaration.
  -- 		vim.g.sonokai_enable_italic = true
  -- 		vim.cmd.colorscheme("sonokai")
  -- 	end,
  -- },
}
