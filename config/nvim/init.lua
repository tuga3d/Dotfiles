require('settings')
require('mappings')
require('autocmds')

require('plugins')
require('plugins_config')

vim.cmd[[let g:python_host_prog = '/usr/bin/python']]
vim.cmd[[let g:python3_host_prog = '/usr/bin/python3']]

-- colorscheme
vim.g.onedark_hide_endofbuffer=1
vim.g.onedark_terminal_italics=1
vim.cmd[[colorscheme onedark]]

-- Stop it!!!
vim.cmd[[cabbrev W w]]

