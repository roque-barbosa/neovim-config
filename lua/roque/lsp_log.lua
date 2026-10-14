local MAX_BYTES = 50 * 1024 * 1024

local log = vim.lsp.log.get_filename()
local stat = vim.uv.fs_stat(log)

if stat and stat.size > MAX_BYTES then
  local fd = vim.uv.fs_open(log, "w", 420) -- 0644, truncates
  if fd then
    vim.uv.fs_close(fd)
    vim.notify(
      ("Truncated lsp.log (was %.1f GB)"):format(stat.size / 1024 / 1024 / 1024),
      vim.log.levels.INFO
    )
  end
end
