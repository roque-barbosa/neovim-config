return {
	--[[{
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
					colors.bg_dark = "#0C0C0C"
					colors.bg = "#222831"
					colors.blue = "#7BD3EA"
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
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {
							ui = {
								bg = "#11110e",
							},
						},
						all = {
							ui = { bg_gutter = "none" },
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
				theme = "dragon", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
			})

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
