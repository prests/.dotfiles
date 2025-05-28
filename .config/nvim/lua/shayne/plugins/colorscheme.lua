return {
  "rmehri01/onenord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onenord").setup({
      borders = true,
      fade_nc = false,
      style = "dark", -- or "light"
      disable = {
        background = false,
        cursorline = false,
        end_of_buffer_lines = false,
      },
      custom_highlights = {}, -- You can override specific highlights here
    })

    vim.cmd.colorscheme("onenord")
  end,
}
