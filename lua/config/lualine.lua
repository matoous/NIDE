local icons = require("nvim-nonicons")

local function lsp_servers_status()
  local clients = vim.lsp.buf_get_clients(0)
  if vim.tbl_isempty(clients) then
    return ""
  end

  local client_names = {}
  for _, client in pairs(clients) do
    table.insert(client_names, client.name)
  end

  -- return icons.get("zap") .. " " .. table.concat(client_names, "|")
  return table.concat(client_names, "|")
end

require("lualine").setup({
  options = { theme = "catppuccino", section_separators = "", component_separators = "" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "branch", icon = icons.get("git-branch") }, { "diff", colored = false } },
    lualine_c = { { "filename", path = 1 }, { "location" } },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
      },
    },
    lualine_y = {
      {
        "encoding",
        -- show encoding only if not utf-8
        condition = function()
          return vim.bo.fileencoding and #vim.bo.fileencoding > 0 and vim.bo.fileencoding ~= "utf-8"
        end,
      },
      {
        "fileformat",
        -- show fileformat only if not unix
        condition = function()
          return vim.bo.fileformat ~= "unix"
        end,
        icons_enabled = false,
      },
      { "filetype", icons_enabled = false },
    },
    lualine_z = { lsp_servers_status },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "nvim-tree" },
})
