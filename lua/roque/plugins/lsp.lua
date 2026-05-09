return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "j-hui/fidget.nvim",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp", -- Fixed: Added to prevent 'module not found' error
    },
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gD", function() require("mini.extra").pickers.lsp({ scope = "definition" }) end, "[G]oto [D]efinition")
          map("gr", function() require("mini.extra").pickers.lsp({ scope = "references" }) end, "[G]oto [R]eferences")
          map("gI", function() require("mini.extra").pickers.lsp({ scope = "implementation" }) end,
            "[G]oto [I]mplementation")
          map("<leader>D", function() require("mini.extra").pickers.lsp({ scope = "type_definition" }) end,
            "Type [D]efinition")
          map("<leader>ds", function() require("mini.extra").pickers.lsp({ scope = "document_symbol" }) end,
            "[D]ocument [S]ymbols")
          map("<leader>ws", function() require("mini.extra").pickers.lsp({ scope = "workspace_symbol" }) end,
            "[W]orkspace [S]ymbols")
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gd", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          -- Fixed: Passing 2nd argument (event.buf) and adding type guard
          local client_id = event.data.client_id
          ---@type vim.lsp.Client?
          local client = vim.lsp.get_client_by_id(client_id)

          if not client then return end

          if client.server_capabilities.documentHighlightProvider then
            local highlight_augroup =
                vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        tailwindcss = {},
        expert = {}, -- Added Expert Elixir LSP
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server_config = servers[server_name] or {}
            server_config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
            -- Fixed: Use standard setup to ensure server-specific hooks trigger
            require("lspconfig")[server_name].setup(server_config)
          end,
        },
      })

      require("fidget").setup({})
    end,
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = {},
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
      })
    end,
  },
}
