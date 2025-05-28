return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/nvim-nio",

    -- Adapters
    "marilari88/neotest-vitest",
    "thenbe/neotest-playwright",
    "nvim-neotest/neotest-go",
  },
  config = function()
    local neotest = require("neotest")

    vim.keymap.set("n", "<leader>tt", function()
      require("neotest").run.run()
    end, { desc = "Run nearest test" })
    vim.keymap.set("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, { desc = "Run test file" })
    vim.keymap.set("n", "<leader>td", function()
      require("neotest").run.run({ strategy = "dap" })
    end, { desc = "Debug nearest test" })
    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").run.stop()
    end, { desc = "Stop test run" })
    vim.keymap.set("n", "<leader>to", function()
      require("neotest").output.open({ enter = true })
    end, { desc = "Open test output" })
    vim.keymap.set("n", "<leader>tO", function()
      require("neotest").output_panel.toggle()
    end, { desc = "Toggle output panel" })
    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").summary.toggle()
    end, { desc = "Toggle summary view" })
    vim.keymap.set("n", "[t", function()
      require("neotest").jump.prev({ status = "failed" })
    end, { desc = "Jump to previous failed test" })
    vim.keymap.set("n", "]t", function()
      require("neotest").jump.next({ status = "failed" })
    end, { desc = "Jump to next failed test" })

    neotest.setup({
      adapters = {
        require("neotest-vitest")({
          is_test_file = function(file_path)
            return file_path:match("_spec%.ts$") or file_path:match("%.test%.ts$")
          end,
        }),

        require("neotest-playwright").adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        }),

        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-v" },
        }),
      },
    })
  end,
}
