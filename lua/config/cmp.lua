local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- supertab-like mapping
local mapping = {
  ["<C-e>"] = cmp.mapping({
    i = cmp.mapping.close(),
    c = cmp.mapping.close(),
  }),
  ["<CR>"] = cmp.mapping.confirm(),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
    elseif check_back_space() then
      vim.fn.feedkeys(t("<Tab>"), "n")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}

local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      -- load lspkind icons
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        buffer = "[BUF]",
      })[entry.source.name]

      return vim_item
    end,
  },
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  sources = {
    { name = 'copilot' },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = mapping,
})
