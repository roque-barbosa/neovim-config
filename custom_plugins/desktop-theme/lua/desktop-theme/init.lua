local M = {}

local theme_dir = vim.fn.expand("~/.config/quickshell")
local theme_file = theme_dir .. "/current_theme"
local off_file = vim.fn.stdpath("state") .. "/desktop-theme-off"

local fallback

local function catppuccin(overrides)
  require("catppuccin").setup({ flavour = "mocha", color_overrides = { mocha = overrides or {} } })
  vim.cmd.colorscheme("catppuccin")
end

local function gruvbox(overrides)
  vim.o.background = "dark"
  require("gruvbox").setup({ palette_overrides = overrides or {} })
  vim.cmd.colorscheme("gruvbox")
end

M.themes = {
  ["rose-pine-moon"] = function()
    require("rose-pine").setup({ variant = "moon" })
    vim.cmd.colorscheme("rose-pine")
  end,
  ["tokyo-night"] = function()
    require("tokyonight").setup({ style = "night" })
    vim.cmd.colorscheme("tokyonight")
  end,
  ["catppuccin-mocha"] = function() catppuccin() end,
  -- Mocha accents on near-black
  ["catppuccin-dark"] = function()
    catppuccin({ base = "#010101", mantle = "#0a0a0a", crust = "#000000" })
  end,
  -- Near-black, softer pastels, pink swapped for soft gray
  ["catppuccin-pastel"] = function()
    catppuccin({
      base = "#010101", mantle = "#0a0a0a", crust = "#000000",
      surface0 = "#1f1f23", surface1 = "#2c2c32", surface2 = "#4a4a52",
      overlay0 = "#5e5e68", overlay1 = "#72727c", overlay2 = "#8c8c96",
      subtext0 = "#a9a9b3", subtext1 = "#c0c2cc", text = "#d6d8e0",
      rosewater = "#d0d2da", flamingo = "#c0c2cc", pink = "#c0c2cc",
      mauve = "#c6b8ea", red = "#e8a3a3", maroon = "#eeb4b4",
      peach = "#f0c8a8", yellow = "#f2e2b6", green = "#b8dcb4",
      teal = "#aedcd4", sky = "#acd8e4", sapphire = "#acd8e4",
      blue = "#a9c6f2", lavender = "#bcd3f5",
    })
  end,
  ["gruvbox"] = function() gruvbox() end,
  -- Near-black, softened accents, purple role swapped for warm gray
  ["gruvbox-pastel"] = function()
    gruvbox({
      dark0_hard = "#010101", dark0 = "#010101", dark0_soft = "#0a0a0a",
      dark1 = "#1f1d1a", dark2 = "#2a2724", dark3 = "#3a3631", dark4 = "#4a4640",
      light0_hard = "#e6dccb", light0 = "#dfd5c1", light0_soft = "#d6ccb8",
      light1 = "#dfd5c1", light2 = "#cfc5b2", light3 = "#bcb3a2", light4 = "#a9a193",
      gray = "#7a746a",
      bright_red = "#e6907f", bright_green = "#c2c074", bright_yellow = "#e5c57c",
      bright_blue = "#9fb8b0", bright_purple = "#c2b8a8", bright_aqua = "#b0c99a",
      bright_orange = "#e6a871",
      neutral_red = "#e6907f", neutral_green = "#c2c074", neutral_yellow = "#e5c57c",
      neutral_blue = "#9fb8b0", neutral_purple = "#c2b8a8", neutral_aqua = "#b0c99a",
      neutral_orange = "#e6a871",
    })
  end,
}

local function enabled()
  return vim.uv.fs_stat(off_file) == nil
end

function M.current()
  local f = io.open(theme_file, "r")
  if not f then return nil end
  local name = vim.trim(f:read("*a") or "")
  f:close()
  return name
end

function M.apply()
  if not enabled() then return end
  local apply = M.themes[M.current() or ""]
  if not apply then return end
  local ok, err = pcall(apply)
  if not ok then
    vim.notify("desktop-theme: " .. tostring(err), vim.log.levels.WARN)
  end
end

local function watch()
  local watcher = vim.uv.new_fs_event()
  if not watcher then return end
  local pending = false
  watcher:start(theme_dir, {}, function(_, filename)
    if filename ~= "current_theme" or pending then return end
    pending = true
    vim.defer_fn(function()
      pending = false
      M.apply()
    end, 150)
  end)
  vim.api.nvim_create_autocmd("VimLeavePre", { callback = function() watcher:stop() end })
end

function M.setup()
  fallback = vim.g.colors_name

  vim.api.nvim_create_user_command("DesktopTheme", function(opts)
    local arg = opts.args ~= "" and opts.args or "toggle"
    if arg == "on" or (arg == "toggle" and not enabled()) then
      os.remove(off_file)
      M.apply()
    else
      vim.fn.mkdir(vim.fn.fnamemodify(off_file, ":h"), "p")
      local f = io.open(off_file, "w")
      if f then f:close() end
      if fallback then pcall(vim.cmd.colorscheme, fallback) end
    end
  end, {
    nargs = "?",
    complete = function() return { "on", "off", "toggle" } end,
    desc = "Follow the desktop (Quickshell) theme",
  })

  watch()
  M.apply()
end

return M
