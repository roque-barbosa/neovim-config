-- Follow the desktop (Quickshell) theme on machines that have one; skipped everywhere else
local has_desktop = vim.uv.fs_stat(vim.fn.expand("~/.config/quickshell/current_theme")) ~= nil

return {
  {
    dir = vim.fn.stdpath("config") .. "/custom_plugins/desktop-theme",
    name = "desktop-theme",
    enabled = has_desktop,
    lazy = false,
    priority = 900, -- after the default colorscheme (priority 1000), so it can override it
    config = function()
      require("desktop-theme").setup()
    end,
  },
  -- Colorschemes the desktop themes map to; loaded on demand by desktop-theme
  { "rose-pine/neovim", name = "rose-pine", lazy = true, enabled = has_desktop },
  { "folke/tokyonight.nvim", lazy = true, enabled = has_desktop },
  { "catppuccin/nvim", name = "catppuccin", lazy = true, enabled = has_desktop },
  { "ellisonleao/gruvbox.nvim", lazy = true, enabled = has_desktop },
}
