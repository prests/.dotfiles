local opt = vim.opt

opt.confirm = true
opt.autoread = true

opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

opt.updatetime = 250
opt.timeoutlen = 300
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.showmode = false
opt.showcmd = false

opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
