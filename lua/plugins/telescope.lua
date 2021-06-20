-- Finder, filter, picker with plenty of features and support
-- for almost anything.
local set_keymap = require('../common').set_keymap
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set_keymap('n', '<leader>fa', '<cmd>Telescope commands<cr>')
set_keymap('n', '<leader>fm', '<cmd>Telescope git_commits<cr>')
set_keymap('n', '<leader>fl', '<cmd>Telescope lsp_document_symbols<cr>')
set_keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
-- alt + enter code actions, not in your VIM
set_keymap('n', '<A-CR>', '<cmd>Telescope lsp_code_actions<cr>')

local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        },
    },
})

