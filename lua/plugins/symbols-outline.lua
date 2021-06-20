vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = false,
    auto_preview = false,
    position = 'left',
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}

-- toggle symbol outline with <leader>to
vim.api.nvim_set_keymap("n", "<leader>to", ":SymbolsOutline<CR>", {silent = true, noremap = true })

