require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "lua", "python", "rust", "bash", "yaml"},
    highlight = { enable = true },
    folds = { enable = true },
    indent = { enable = true },
}

vim.wo.foldmethod='expr'
vim.wo.foldexpr='nvim_treesitter#foldexpr()'
