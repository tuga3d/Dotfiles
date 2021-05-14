vim.o.completeopt = "menuone,noselect"
require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = {kind = "   (Path)"},
        buffer = {kind = "   (Buffer)"},
        calc = {kind = "   (Calc)"},
        vsnip = {kind = "   (Snippet)"},
        nvim_lsp = {kind = "   (LSP)"},
        nvim_lua = {kind = "  "},
        spell = {kind = "   (Spell)"},
        emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
    }
}

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "(pumvisible() ? compe#confirm() : '<CR>')", {expr = true})
vim.api.nvim_set_keymap("i", "<ESC>", "(pumvisible() ? compe#close() : '<ESC>')", {expr = true})
vim.api.nvim_set_keymap("i", "<UP>", "(pumvisible() ? '<C-p>' : '<UP>')", {expr = true})
vim.api.nvim_set_keymap("i", "<DOWN>", "(pumvisible() ? '<C-n>' : '<DOWN>')", {expr = true})

