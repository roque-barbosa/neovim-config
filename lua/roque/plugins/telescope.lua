return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "plenary"
  },
  keys = {},
  config = function()
    require('telescope').setup({
      defaults = {
        -- configure to use ripgrep
        vimgrep_arguments = {
          "rg",
          -- "--follow",        -- Follow symbolic links
          "--hidden",        -- Search for hidden files
          -- "--no-heading",    -- Don't group matches by each file
          -- "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search
        },
      },
      extensions = {
        file_browser = {
          -- theme = "dracula",
          -- disables netrw and use telescope-file-browser in its place
          hidden = { file_browser = false, folder_browser = false },
          hijack_netrw = true,
          quiet = true,
          no_ignore = true,
          follow_symlinks = true,
          grouped = true,
          files = true,
          -- mappings = {
          --   ["i"] = {
          --     -- your custom insert mode mappings
          --   },
          --   ["n"] = {
          --     -- your custom normal mode mappings
          --   },
          -- },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
          },
        },
      },
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<space>pv", ":Telescope file_browser<CR>")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
    require("telescope").load_extension "file_browser"
  end
}
