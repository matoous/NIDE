local icons = require("nvim-nonicons")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   underline = true,
   virtual_text = {
     spacing = 0,
     severity_limit = "Warning",
     prefix = '⚡',
   },
 }
)

vim.fn.sign_define('LspDiagnosticsSignError', { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require 'illuminate'.on_attach(client)

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Moving around:
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- Docs:
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- Show (s) things:
  buf_set_keymap('n', '<leader>sf', '<Cmd>:Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', '<leader>sa', '<cmd>:Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', '<leader>sp', '<cmd>:Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<leader>se', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>sd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- Do changes (c):
  buf_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap("n", "<leader>cm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- Navigate
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

local servers = {
    bashls = {},
    cssls = {},
    denols = {},
    dockerls = {},
    gopls = {},
    html = {},
    jsonls = {},
    pyls = {},
    rust_analyzer = {},
    terraformls = {},
    tflint = {},
    tsserver = {},
    vimls = {},
    yamlls = {},
}

local nvim_lsp = require('lspconfig')

for ls, settings in pairs(servers) do
  nvim_lsp[ls].setup {
    on_attach = on_attach,
    settings = settings,
    capabilities = capabilities,
  }
end

