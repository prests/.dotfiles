vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- go-dap
keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>")
keymap.set("n", "<leader>dus", function()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end)
keymap.set("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end)
keymap.set("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end)

keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" }) -- show lsp definitions
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" }) -- show lsp implementations
keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Show LSP type definitions" }) -- show lsp type definitions
keymap.set("n", "gl", "<cmd><CR>", { desc = "Show LSP diagnostics" }) -- show lsp diagnostics
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" }) -- smart rename
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" }) -- show  diagnostics for file
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" }) -- show diagnostics for line
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" }) -- jump to previous diagnostic in buffer
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" }) -- jump to next diagnostic in buffer
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentations for what is under cursor" }) -- show documentation for what is under cursor
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary
