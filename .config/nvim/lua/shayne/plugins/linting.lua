return {
  "jose-elias-alvarez/null-ls.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.diagnostics.phpstan,
      },
    })
  end,
}
