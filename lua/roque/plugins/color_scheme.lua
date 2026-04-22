return {
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
            Normal       = { bg = "#1e1e1e", fg = "#d4d4d4" },
            EndOfBuffer  = { bg = "#1e1e1e" },
            Comment      = { fg = "#9a9a9a", italic = true },
            LineNr       = { fg = "#5a5a5a" },
            CursorLineNr = { fg = "#d4d4d4" },
            VertSplit    = { fg = "#2d2d2d", bg = "#1e1e1e" },
            NormalFloat  = { bg = "#252526" },
            FloatBorder  = { fg = "#2d2d2d", bg = "#252526" },
          }
        end,
      })
      vim.cmd.colorscheme("monokai-pro")
    end,
  }
}
