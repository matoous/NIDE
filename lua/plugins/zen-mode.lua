require"zen-mode".setup {
  window = { backdrop = 1, options = { signcolumn = "no" } },
  plugins = { tmux = true },
}

vim.api.nvim_set_keymap("n", "<leader>tz", ":ZenMode<cr>", {silent = true, noremap = true})

