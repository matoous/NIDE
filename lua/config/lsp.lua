local icons = require("nvim-nonicons")
local nvim_lsp = require("lspconfig")
local wk = require("which-key")
local lsp_installer = require("nvim-lsp-installer")
local configs = require("lspconfig/configs")
local util = require("lspconfig/util")

local path = util.path

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 2,
    severity_limit = "Warning",
    prefix = "⚡",
  },
})

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", texthl = "LspDiagnosticsDefaultInformation" })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require("illuminate").on_attach(client)
  require("lsp_signature").on_attach()
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    g = {
      name = "Go to",
      D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
      r = { "<Cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
      d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
    },
    K = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Help on hover" },
    ["<C-k>"] = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
    ["<leader>"] = {
      s = {
        name = "Show",
        f = { "<cmd>Telescope lsp_workspace_symbols theme=cursor<CR>", "Show finder for current symbol" },
        a = { "<cmd>Telescope lsp_code_actions theme=cursor<CR>", "Show code actions" },
        p = { "<cmd>Telescope lsp_definitions theme=cursor<CR>", "Show preview of definition" },
        e = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show errors" },
        d = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Show type definition" },
      },
      m = {
        name = "Make",
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format code" },
      },
    },
  }, {
    buffer = bufnr,
    mode = "n",
    noremap = true,
    silent = true,
  })

  vim.notify(client.name .. ": attached LSP server", "info")
end

lsp_installer.on_server_ready(function(server)
  server:setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end)
