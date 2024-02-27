return {
  'nanozuki/tabby.nvim',
  event = 'VimEnter',
  dependencies = 'web-devicons',
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
  end,
}
