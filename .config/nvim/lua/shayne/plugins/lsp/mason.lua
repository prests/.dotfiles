return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "gopls",
        "htmx",
        "templ",
        "terraformls",
        "tflint",
        "phpstan",
        "intelephense",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    require("mason-lspconfig").setup_handlers({
      -- Will be called for each installed server that doesn't have
      -- a dedicated handler.
      --
      function(server_name) -- default handler (optional)
        -- https://github.com/neovim/nvim-lspconfig/pull/3232
        if server_name == "tsserver" then
          server_name = "ts_ls"
        end
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig")[server_name].setup({

          capabilities = capabilities,
        })
      end,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- js linter
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
        "hclfmt",
        "php-cs-fixer",
        "phpstan",
      },
    })
  end,
}
