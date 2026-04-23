return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    init = function(plugin)
      -- The new branch handles RTP differently, but keeping the lazy loader
      -- helper is fine if you're on a complex setup.
      -- Note: query_predicates requirement is removed as it's now internal.
      require("lazy.core.loader").add_to_rtp(plugin)
    end,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main", -- CRITICAL: Must also be on main
        config = function()
          -- The new 'main' branch of textobjects handles the diff logic
          -- and registration differently. This simplified block ensures
          -- the module is loaded without crashing on 'configs'.
          require("nvim-treesitter-textobjects")
        end,
      },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSenable" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>",      desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
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
        "markdown", -- Added to prevent the initial 'conceal' error
        "markdown_inline",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
    config = function(_, opts)
      -- Filter duplicates from ensure_installed
      if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then return false end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end

      -- Use the new entry point for the 'main' branch
      require("nvim-treesitter").setup(opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
