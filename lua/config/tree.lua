local icons = require("nvim-nonicons")
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
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
  },
}
vim.g.group_empty = 1
vim.g.highlight_opened_files = 1
vim.g.ignore = { ".git", "node_modules", "__pycache__", ".idea", "venv" }

require("nvim-tree").setup({
  open_on_setup = true,
  auto_close = true,
  view = {
    width = 30,
    auto_resize = true,
  },
})
