local opts = {noremap = true, silent = true}

-- Map leader key
vim.g.mapleader = ' '

-- Indent
vim.api.nvim_set_keymap('n', '<', '<<', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)
vim.api.nvim_set_keymap('n', '>', '>>', opts)
vim.api.nvim_set_keymap('v', '>', '>gv', opts)

-- Make Y work
vim.api.nvim_set_keymap('n', 'Y', 'y$', opts)

-- Buffer movement
vim.api.nvim_set_keymap('n', '<backspace>', '<C-^>', opts)
vim.api.nvim_set_keymap('n', 'gb', ':bn<cr>', opts)
vim.api.nvim_set_keymap('n', 'gB', ':bp<cr>', opts)

-- keep cursor in place while joining lines
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)

-- Move in soft wrapped lines
vim.cmd[[map <silent> <Up> gk]]
vim.cmd[[imap <silent> <Up> <C-o>gk]]
vim.cmd[[map <silent> <Down> gj]]
vim.cmd[[imap <silent> <Down> <C-o>gj]]
vim.cmd[[map <silent> <home> g<home>]]
vim.cmd[[imap <silent> <home> <C-o>g<home>]]
vim.cmd[[map <silent> <End> g<End>]]
vim.cmd[[imap <silent> <End> <C-o>g<End>]]

-- sane navigation in the wildmenu (useful for navigating in :e)
vim.cmd[[set wildcharm=<C-Z>]]
vim.cmd[[cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"]]
vim.cmd[[cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"]]
vim.cmd[[cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"]]
vim.cmd[[cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"]]

-- ("TAB") Folding
-- In normal mode, press Tab to toggle the current fold open/closed.
-- In addition, with the manual fold method, you can create a fold
-- by visually selecting some lines, then pressing Tab.
vim.cmd[[nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Tab>")<CR>]]
vim.cmd[[vnoremap <Tab> zf]]

-- ("<Ctrl>l") Clear Highlight
vim.cmd[[nnoremap <silent> <c-l> :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr><c-l>]]
