local parsers = {
  "bash",
  "svelte",
  "html",
  "javascript",
  "json",
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
  "dart",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({})

      local installed = {}
      for _, lang in ipairs(ts.get_installed("parsers")) do
        installed[lang] = true
      end

      local missing = vim.tbl_filter(function(lang)
        return not installed[lang]
      end, parsers)

      if #missing > 0 then
        ts.install(missing, { summary = true })
      end

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
          "dart",
        },
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match) or args.match
          if not pcall(vim.treesitter.get_parser, args.buf, lang) then
            return
          end

          vim.treesitter.start(args.buf, lang)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
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
