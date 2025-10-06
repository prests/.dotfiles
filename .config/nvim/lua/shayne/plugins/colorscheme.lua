return {
  "rmehri01/onenord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Function to detect macOS system theme
    local function get_system_theme()
      -- Helper function to read defaults
      local function read_default(key)
        local handle = io.popen("defaults read -g " .. key .. " 2>/dev/null")
        if handle then
          local result = handle:read("*a"):gsub("%s+", "")
          handle:close()
          return result
        end
        return ""
      end

      local auto_switch = read_default("AppleInterfaceStyleSwitchesAutomatically") == "1"
      local is_dark_style = read_default("AppleInterfaceStyle") == "Dark"
      local style_exists = read_default("AppleInterfaceStyle") ~= ""

      if auto_switch then
        return style_exists and "light" or "dark"
      else
        return style_exists and "dark" or "light"
      end
    end

    local system_theme = get_system_theme()

    local colors = require("onenord.colors").load()

    require("onenord").setup({
      borders = true,
      fade_nc = true,
      style = "dark",
      disable = {
        cursorline = true,
        end_of_buffer_lines = false,
      },
      -- custom_highlights = {
      --   light = {
      --     -- Custom overrides for better visibility in light mode
      --     -- Addresses poor contrast issues with default onenord light theme
      --     -- Search highlighting - use darker background for better contrast
      --     Search = { fg = colors.bg, bg = colors.blue, style = "bold" },
      --     -- Incremental search - use darker background
      --     IncSearch = { fg = colors.bg, bg = colors.orange, style = "bold,underline" },
      --     -- Visual selection (not owning) - same as Visual
      --     VisualNOS = { fg = colors.none, bg = colors.light_gray },
      --     -- Match parentheses - use darker foreground with background
      --     MatchParen = { fg = colors.bg, bg = colors.orange, style = "bold" },
      --     -- Line numbers - darker for better readability
      --     LineNr = { fg = colors.gray },
      --     -- Current line number - make it stand out more
      --     CursorLine = { fg = colors.none, bg = colors.float },
      --     CursorLineNr = { fg = colors.dark_blue, style = "bold" },
      --     -- Telescope selection - better contrast
      --     TelescopeSelection = { fg = colors.bg, bg = colors.blue },
      --     TelescopeSelectionCaret = { fg = colors.orange },
      --     -- Pmenu selection - better contrast
      --     PmenuSel = { fg = colors.bg, bg = colors.blue },
      --     -- LSP reference highlighting - more visible
      --     LspReferenceText = { bg = colors.light_gray, style = "bold" },
      --     LspReferenceRead = { bg = colors.light_gray, style = "bold" },
      --     LspReferenceWrite = { bg = colors.light_gray, style = "bold" },
      --   },
      -- },
    })

    vim.cmd.colorscheme("onenord")
  end,
}
