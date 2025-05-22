return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    -- Utility to get fallback color from existing highlight groups
    local function get_fg(group)
      local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
      if ok and hl and hl.fg then
        return string.format("#%06x", hl.fg)
      end
    end

    -- Derive colors from common highlight groups
    local colors = {
      RainbowRed = get_fg("TSKeyword") or "#E06C75",
      RainbowYellow = get_fg("TSBoolean") or "#E5C07B",
      RainbowBlue = get_fg("TSFunction") or "#61AFEF",
      RainbowOrange = get_fg("TSConditional") or "#D19A66",
      RainbowGreen = get_fg("TSString") or "#98C379",
      RainbowViolet = get_fg("TSInclude") or "#C678DD",
      RainbowCyan = get_fg("TSConstant") or "#56B6C2",
    }

    -- Apply highlight groups
    for group, color in pairs(colors) do
      vim.api.nvim_set_hl(0, group, { fg = color })
    end

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        lua = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = vim.tbl_keys(colors),
    }
  end,
}
