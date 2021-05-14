-- bootstrap
local path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(path)) > 0 then
  local repo = 'https://github.com/wbthomason/packer.nvim'
  vim.api.nvim_command('!git clone ' .. repo .. ' ' .. path)
  vim.cmd[[packadd packer.nvim]]
end

vim.cmd[[packadd packer.nvim]]


-- plugins
return require('packer').startup {
    function(use)
        use {'wbthomason/packer.nvim', opt=true}
        use {'nvim-telescope/telescope.nvim', requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}
        }}
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use 'joshdick/onedark.vim'
        use 'tpope/vim-repeat'
        use 'tpope/vim-surround'
        use 'terrortylor/nvim-comment'
        use 'jiangmiao/auto-pairs'
        use 'harenome/vim-neatfoldtext'
        use 'akinsho/nvim-toggleterm.lua'
        use 'hoob3rt/lualine.nvim'

        use 'neovim/nvim-lspconfig'
        use 'onsails/lspkind-nvim'
        use 'glepnir/lspsaga.nvim'
        use 'hrsh7th/nvim-compe'
  end,

  config = {
    display = {
      open_fn = require"packer.util".float
    }
  }
}

