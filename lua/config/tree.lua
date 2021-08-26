local icons = require("nvim-nonicons")
vim.g.nvim_tree_icons = {
     default = '',
     symlink = '',
     git = {
       unstaged = "✗",
       staged = "✓",
       unmerged = "",
       renamed = "➜",
       untracked = "★",
       deleted = "",
       ignored = "◌"
       },
     folder = {
       arrow_open = "",
       arrow_closed = "",
       default = "",
       open = "",
       empty = "",
       empty_open = "",
       symlink = "",
       symlink_open = "",
       },
       lsp = {
         hint = "",
         info = "",
         warning = "",
         error = "",
       }
     }
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '__pycache__', '.idea', 'venv' }
