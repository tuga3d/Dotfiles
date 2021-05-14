-- Global Options
vim.o.updatetime = 800
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.confirm = true
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.inccommand = 'split'
vim.o.clipboard = 'unnamedplus'
vim.o.iskeyword = vim.o.iskeyword .. '-'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.pumheight = 10
vim.o.showbreak = '…'
vim.o.listchars = 'tab:▷ ,trail:·,precedes:…,extends:…'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Window Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.cursorline = true
vim.wo.list = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.breakindentopt = 'shift:2'

-- Buffer Options
vim.bo.smartindent = true

