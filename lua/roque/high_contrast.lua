local M = {}
local active = false

local function darken(color_int, factor)
  local r = math.floor(math.floor(color_int / 65536) * factor)
  local g = math.floor(math.floor((color_int % 65536) / 256) * factor)
  local b = math.floor((color_int % 256) * factor)
  return r * 65536 + g * 256 + b
end

local function luminance(color_int)
  local r = math.floor(color_int / 65536)
  local g = math.floor((color_int % 65536) / 256)
  local b = color_int % 256
  return 0.299 * r + 0.587 * g + 0.114 * b
end

-- Colored backgrounds are darkened; neutral ones brighter than Normal become a
-- dim highlight so selections stay visible; everything else becomes pure black
local function is_vibrant(color_int)
  local r = math.floor(color_int / 65536)
  local g = math.floor((color_int % 65536) / 256)
  local b = color_int % 256
  return math.max(r, g, b) - math.min(r, g, b) > 40
end

function M.enable()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  local normal_lum = luminance(normal_hl.bg or 0)

  local all_hls = vim.api.nvim_get_hl(0, {})
  for name, hl in pairs(all_hls) do
    if hl.bg ~= nil then
      local new_hl = vim.deepcopy(hl)
      if is_vibrant(hl.bg) then
        new_hl.bg = darken(hl.bg, 0.4)
      elseif luminance(hl.bg) > normal_lum then
        new_hl.bg = 0x1c1c1c
      else
        new_hl.bg = 0x000000
      end
      vim.api.nvim_set_hl(0, name, new_hl)
    end
  end
  active = true
  vim.notify("High contrast on", vim.log.levels.INFO)
end

function M.disable()
  vim.cmd("colorscheme " .. (vim.g.colors_name or "default"))
  active = false
  vim.notify("High contrast off", vim.log.levels.INFO)
end

function M.toggle()
  if active then M.disable() else M.enable() end
end

vim.api.nvim_create_user_command("HighContrast", function(opts)
  local arg = opts.args ~= "" and opts.args or nil
  if arg == "on" then
    M.enable()
  elseif arg == "off" then
    M.disable()
  else
    M.toggle()
  end
end, {
  nargs = "?",
  complete = function() return { "on", "off" } end,
  desc = "Toggle high contrast (000 background) variant of current colorscheme",
})

return M
