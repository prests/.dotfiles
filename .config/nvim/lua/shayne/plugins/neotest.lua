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
