local augroups = {
    -- Press Enter to jump to the subject (topic) under the cursor.
    -- Press Backspace to return from the last jump.
    -- Press s to find next subject, or S to find previous subject.
    -- Press o to find next option, or O to find previous option.
    help = {
        {"Filetype", "help", "nnoremap <buffer> <CR> <C-]>"},
        {"Filetype", "help", "nnoremap <buffer> <BS> <C-T>"},
        -- {"Filetype", "help", "nnoremap <buffer> o /'\l\{2,\}'<CR>"};
        -- {"Filetype", "help", "nnoremap <buffer> O ?'\l\{2,\}'<CR>"};
        -- {"Filetype", "help", "nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>"};
        -- {"Filetype", "help", "nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>"};
    },
    highlight_yank = {
        {"TextYankPost", "*", "silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=500}"}
    }
}

local function define_augroups(definitions)
    -- Create autocommand groups based on the passed definitions
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

define_augroups(augroups)

