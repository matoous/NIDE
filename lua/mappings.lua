vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

local set_keymap = require('common').set_keymap
local nvim_set_keymap = require('common').nvim_set_keymap

set_keymap('i', 'jj', '<Esc>')
set_keymap('n', 'Y', 'y$')

set_keymap('n', '<leader>x', '"_x')
set_keymap('n', '<leader>d', '"_d')
set_keymap('v', '<leader>D', '"_D')

set_keymap('n', '<C-k>', ':wincmd k<CR>')
set_keymap('n', '<C-j>', ':wincmd j<CR>')
set_keymap('n', '<C-h>', ':wincmd h<CR>')
set_keymap('n', '<C-l>', ':wincmd l<CR>')

set_keymap('n', '<C-n>', ':cnext<CR>')
set_keymap('n', '<C-p>', ':cprevious<CR>')
set_keymap('n', '<C-c>', ':cclose<CR>')

set_keymap('n', '<leader>q', '<cmd>q<CR>')
set_keymap('n', '<leader>Q', '<cmd>q!<CR>')

set_keymap('n', '<Up>', '<Nop>')
set_keymap('n', '<Down>', '<Nop>')
set_keymap('n', '<Left>', '<Nop>')
set_keymap('n', '<Right>', '<Nop>')
set_keymap('i', '<Up>', '<Nop>')
set_keymap('i', '<Down>', '<Nop>')
set_keymap('i', '<Left>', '<Nop>')
set_keymap('i', '<Right>', '<Nop>')

set_keymap('n', '<leader>ts', ':setlocal spell!<CR>')

