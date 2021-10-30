local icons = require("nvim-nonicons")
local nvim_lsp = require("lspconfig")
local wk = require("which-key")
local lspinstall = require("lspinstall")
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
        f = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Show finder for current symbol" },
        a = { "<cmd>Telescope lsp_code_actions<CR>", "Show code actions" },
        p = { "<cmd>Telescope lsp_definitions<CR>", "Show preview of definition" },
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

  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.notify(client.name .. ": attached LSP server", "info")
end

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return exepath("python3") or exepath("python") or "python"
end

lspinstall.setup()
local servers = lspinstall.installed_servers()

for _, server in ipairs(servers) do
  nvim_lsp[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end
