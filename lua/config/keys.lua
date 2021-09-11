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
      b = { "<cmd>GitBlameToggle<CR>", "Toggle git blame" },
      o = { ":SymbolsOutline<CR>", "Toggle symbols outline" },
      r = { "<cmd>TroubleToggle<CR>", "Toggle trouble" },
      s = { ":setlocal spell!<CR>", "Toggle spell check" },
      t = { "<cmd>NvimTreeToggle<CR>", "Toggle tree" },
    },
    f = {
      name = "Find stuff",
      a = { "<cmd>Telescope commands<CR>", "Find actions (commands)" },
      b = { "<cmd>Telescope buffers<CR>", "Find buffer" },
      c = { "<cmd>Telescope git_commits<CR>", "Find commits" },
      f = { "<cmd>Telescope find_files<CR>", "Find files" },
      g = { "<cmd>Telescope live_grep<CR>", "Find anything (grep)" },
      h = { "<cmd>Telescope help_tags<CR>", "Find help" },
      k = { "<cmd>Telescope keymaps<CR>", "Find keymap entry" },
      s = { "<cmd>Telescope lsp_document_symbols<CR>", "Find symbols" },
      r = { "<cmd>Telescope lsp_references<CR>", "Find references" },
    },
  },
  g = {
    x = { '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', "Open urel under cursor in browser"},
  },
  ["<C-k>"] = { ":wincmd k<CR>", "Focus pane to the top" },
  ["<A-TAB>"] = { "<Cmd>BufferNext<CR>", "Next buffer tab" },
  ["<S-A-TAB>"] = { "<Cmd>BufferPrevious<CR>", "Previous buffer tab" },
  ["<A-w>"] = { "<Cmd>BufferClose<CR>", "Close buffer tab" },
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

