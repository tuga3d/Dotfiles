require('plugins_config.telescope')
require('plugins_config.treesitter')
require('plugins_config.compe')
require('plugins_config.lsp')

-- https://github.com/hoob3rt/lualine.nvim
require('lualine').setup{ options = { theme = 'onedark' } }

-- https://github.com/harenome/vim-neatfoldtext
vim.g.NeatFoldTextFancy=1

-- https://github.com/terrortylor/nvim-comment
require('nvim_comment').setup({comment_empty = false})

-- https://github.com/akinsho/nvim-toggleterm.lua
require('toggleterm').setup{
    size = 10,
    open_mapping = [[<c-\>]],
    direction = 'float',
    float_opts = { border = 'curved' }
}

