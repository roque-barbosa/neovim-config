return {
  {
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
},
--[[
{
"morhetz/gruvbox",
name = "gruvbox",
config = function ()
vim.cmd("colorscheme gruvbox")
end
},]]
--[[{
  "Mofiqul/dracula.nvim",
  name = "dracula",
  config = function()
  vim.cmd("colorscheme dracula")
  end
  },]]
}
