vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local set_keymap = require("common").set_keymap

set_keymap("i", "jj", "<Esc>")
set_keymap("n", "Y", "y$")

set_keymap("n", "<leader>x", '"_x')
set_keymap("v", "<leader>D", '"_D')

set_keymap("n", "<C-k>", ":wincmd k<CR>")
set_keymap("n", "<C-j>", ":wincmd j<CR>")
set_keymap("n", "<C-h>", ":wincmd h<CR>")
set_keymap("n", "<C-l>", ":wincmd l<CR>")

set_keymap("n", "<C-n>", ":cnext<CR>")
set_keymap("n", "<C-p>", ":cprevious<CR>")
set_keymap("n", "<C-c>", ":cclose<CR>")

set_keymap("n", "<leader>q", "<cmd>q<CR>")
set_keymap("n", "<leader>Q", "<cmd>q!<CR>")
