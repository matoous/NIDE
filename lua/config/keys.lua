local wk = require("which-key")

wk.setup({})

wk.register({
  ["<leader>"] = {
    name = "",
    d = {
      [""] = { '"_d', "Delete without yanking" },
      n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Diagnostic next" },
      p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Diagnostic previous" },
    },
    t = {
      s = { ":setlocal spell!<CR>", "Toggle spell check" },
      o = { ":SymbolsOutline<CR>", "Toggle symbols outline" },
      t = { "<cmd>NvimTreeToggle<CR>", "Toggle tree" },
      r = { "<cmd>Trouble<CR>", "Toggle trouble" },
      b = { "<cmd>GitBlameToggle<CR>", "Toggle git blame" },
    },
    f = {
      name = "Find stuff",
      f = { "<cmd>Telescope find_files<CR>", "Find files" },
      g = { "<cmd>Telescope live_grep<CR>", "Find anything (grep)" },
      b = { "<cmd>Telescope buffers<CR>", "Find buffer" },
      h = { "<cmd>Telescope help_tags<CR>", "Find help" },
      a = { "<cmd>Telescope commands<CR>", "Find actions (commands)" },
      c = { "<cmd>Telescope git_commits<CR>", "Find commits" },
      s = { "<cmd>Telescope lsp_document_symbols<CR>", "Find symbols" },
      k = { "<cmd>Telescope keymaps<CR>", "Find keymap entry" },
    },
  },
  ["<C-k>"] = { ":wincmd k<CR>", "Focus pane to the top" },
  ["<A-TAB>"] = { "<Cmd>BufferLineCycleNext<CR>", "Next bufferline tab" },
  ["<S-A-TAB>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous bufferline tab" },
  -- alt + enter code actions like in Goland, TODO: doesn't work right now, changes window fullscreen mode
  ["<A-CR>"] = { "<Cmd>Telescope lsp_code_actions<CR>", "Code actions" },
})

-- disable arrow keys
local disable_keys = {
  ["<Up>"] = { "<Nop>", "which_key_ignore" },
  ["<Down>"] = { "<Nop>", "which_key_ignore" },
  ["<Left>"] = { "<Nop>", "which_key_ignore" },
  ["<Right>"] = { "<Nop>", "which_key_ignore" },
}
wk.register(disable_keys, { mode = 'n', silent = true })
wk.register(disable_keys, { mode = 'i', silent = true })

