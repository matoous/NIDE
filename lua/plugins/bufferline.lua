require "bufferline".setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        mappings = "true"
    }
}

local opt = {silent = true}

vim.api.nvim_set_keymap("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
vim.api.nvim_set_keymap("n", "<S-w>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
vim.api.nvim_set_keymap("n", "<A-TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
vim.api.nvim_set_keymap("n", "<S-A-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

