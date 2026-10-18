local function flutter_path()
  if vim.fn.executable("asdf") == 1 then
    local dir = vim.fn.trim(vim.fn.system({ "asdf", "where", "flutter" }))
    if vim.v.shell_error == 0 and dir ~= "" then
      return dir .. "/bin/flutter"
    end
  end

  local manual = vim.fn.expand("~/.flutter/flutter/bin/flutter")
  if vim.fn.executable(manual) == 1 then
    return manual
  end
end

return {
  -- debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',
    },
    event = 'VeryLazy',
    config = function()
      require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸" },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 10,             -- columns
            position = "bottom",
          },
        },
      })
    end
  },

  -- flutter
  {
    "akinsho/flutter-tools.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup {
        flutter_path = flutter_path(),
        flutter_lookup_cmd = nil,
        fvm = false,
        widget_guides = { enabled = true },
        lsp = {
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {
              vim.fn.expand("$HOME/.pub-cache"),
            },
            renameFilesWithClasses = "prompt",
            updateImportsOnRename = true,
            enableSnippets = false,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          exception_breakpoints = {},
          register_configurations = function(paths)
            local dap = require("dap")
            -- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
            dap.adapters.dart = {
              type = "executable",
              command = paths.flutter_bin,
              args = { "debug-adapter" },
            }
            dap.configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
      }
    end
  },
}
