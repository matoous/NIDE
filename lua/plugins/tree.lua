local icons = require("nvim-nonicons")
vim.g.nvim_tree_icons = {
  default = icons.get("file"),
  symlink = icons.get("file-symlink"),
  git = {
    unstaged = "M",
    staged = "S",
    unmerged = icons.get("git-merge"),
    renamed = "R",
    untracked = "U",
    deleted = "D",
    ignored = "I",
  },
  folder = {
    default = icons.get("file-directory"),
    open = icons.get("file-directory"),
    empty = icons.get("file-directory-outline"),
    empty_open = icons.get("file-directory-outline"),
    symlink = icons.get("file-submodule"),
    symlink_open = icons.get("file-submodule"),
  },
  lsp = { error = "", warning = "", info = "", hint = "" },
}

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_highlight_opened_files = 1

local set_keymap = require('../common').set_keymap
set_keymap('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
set_keymap('n', '<leader>tf', '<cmd>NvimTreeFindFile<cr>')

