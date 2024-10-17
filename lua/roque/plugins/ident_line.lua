return {
  --[[ {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  }, ]]
-- {
--   "echasnovski/mini.indentscope",
--   opts = {
--     symbol = "▏",
--     options = { try_as_border = false },
--   },
--   init = function()
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = {
--         "help",
--         "alpha",
--         "dashboard",
--         "neo-tree",
--         "Trouble",
--         "trouble",
--         "lazy",
--         "mason",
--         "notify",
--         "toggleterm",
--         "lazyterm",
--       },
--       callback = function()
--         vim.b.miniindentscope_disable = true
--       end,
--     })
--   end,
-- }
}
