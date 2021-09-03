local wk = require("which-key")
local cmp = require("cmp")
local luasnip = require("luasnip")

local check_back_space = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- supertab-like mapping
mapping = {
  ["<tab>"] = cmp.mapping(function(fallback)
    if vim.fn.pumvisible() == 1 then
      vim.fn.feedkeys(t("<C-n>"), "n")
    elseif luasnip.expand_or_jumpable() then
      vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
    elseif check_back_space() then
      vim.fn.feedkeys(t("<tab>"), "n")
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<S-tab>"] = cmp.mapping(function(fallback)
    if vim.fn.pumvisible() == 1 then
      vim.fn.feedkeys(t("<C-p>"), "n")
    elseif luasnip.jumpable(-1) then
      vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<C-y>"] = cmp.mapping.confirm {
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  },
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
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "calc" },
    },
    mapping = mapping,
})
