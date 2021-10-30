local icons = require("nvim-nonicons")
require("trouble").setup({
  signs = {
    error = icons.get("x-circle"),
    warning = icons.get("alert"),
    information = icons.get("info"),
    hint = icons.get("comment"),
    other = icons.get("circle"),
  },
})
