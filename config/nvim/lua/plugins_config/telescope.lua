-- https://github.com/nvim-telescope/telescope.nvim

require('telescope').setup {
    defaults = {
        prompt_prefix = " ",
        file_ignore_patterns = { '__pycache__' }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>tg', ':Telescope live_grep<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>tb', ':Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>th', ':Telescope help_tags<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>tc', ':Telescope commands<cr>', opts)

function Edit_neovim()
    require('telescope.builtin').find_files {
        prompt_title = "~ dotfiles ~",
        shorten_path = false,
        cwd = "~/.config/nvim",

        layout_strategy = 'horizontal',
        layout_config = {
            preview_width = 0.65,
        },
    }
end

vim.api.nvim_set_keymap('n', '<leader>ev', ':lua Edit_neovim()<cr>', opts)

