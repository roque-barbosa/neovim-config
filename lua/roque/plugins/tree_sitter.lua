return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        ensure_installed = {
          "bash",
          "svelte",
          "html",
          "javascript",
          "json",
          "jsonc",
          "python",
          "query",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "elixir",
          "heex",
          "eex",
          "markdown",
          "markdown_inline",
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "bash",
          "svelte",
          "html",
          "javascript",
          "json",
          "jsonc",
          "python",
          "tsx",
          "typescript",
          "vim",
          "lua",
          "elixir",
          "heex",
          "eex",
          "markdown",
        },
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo.foldmethod = "expr"
        end,
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
