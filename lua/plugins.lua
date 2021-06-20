local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require"packer".startup(function(use)
  -- Lua plugin manager
  use "wbthomason/packer.nvim"
  -- More text objects to work with
  use "wellle/targets.vim"
  -- autosave files
  use "vim-scripts/vim-auto-save"
  -- popup windows
  use "nvim-lua/popup.nvim"
  -- line with currently open buffers
  use "akinsho/nvim-bufferline.lua"
  -- Easy configuration for the LSP
  use "neovim/nvim-lspconfig"
  -- A pretty diagnostics, references, telescope results, quickfix, etc.
  use "folke/lsp-trouble.nvim"
  -- See lsp status in status bar
  use "nvim-lua/lsp-status.nvim"
  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  -- Theme
  use "marko-cerovac/material.nvim"
  -- Quotes and paranthesis made simple
  use "tpope/vim-surround"
  -- Toggle comments
  use "tpope/vim-commentary"
  -- Git in vim
  use "tpope/vim-fugitive"
  -- Cool complementary pairs of mappings, e.g. ]e to swap with line below, etc.
  use "tpope/vim-unimpaired"
  -- Allow '.' also for plugins, not just native commands
  use "tpope/vim-repeat"
  -- Status line
  use "hoob3rt/lualine.nvim"
  -- Distraction-free coding for Neovimj
  use "folke/zen-mode.nvim"
  -- Open terminal window from within vim
  use "akinsho/nvim-toggleterm.lua"
  -- Display number of search matches & current index
  use "google/vim-searchindex"
  -- Automatically highlight other uses of word under cursor
  use "RRethy/vim-illuminate"
  -- Togglable blame info for current line
  use "f-person/git-blame.nvim"
  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  }
  -- Tree file explorer
  use "kyazdani42/nvim-tree.lua"
  -- More icons and color options, requirement for nonicons
  use "kyazdani42/nvim-web-devicons"
  -- Even more icons and settings
  use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  -- Gutter git signs
  use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }
  -- Completion
  use "hrsh7th/nvim-compe"
  -- html and css templates
  use "mattn/emmet-vim"
  -- Highlight only when searching
  use "romainl/vim-cool"
  -- Support for ledger files
  use "ledger/vim-ledger"
  -- Symbols outline in right panel
  use "simrat39/symbols-outline.nvim"
  -- Easily find key bindings on leader
  use { "folke/which-key.nvim", config = function() require("which-key").setup {} end}
  -- Cool popup windows for certain LSP features (definitions, references, etc.), currently in development
  use "glepnir/lspsaga.nvim"
  -- Languages
  use "google/vim-jsonnet"
  use "tsandall/vim-rego"
  use "cespare/vim-toml"
  -- Icons for completions
  use "onsails/lspkind-nvim"
  -- Create colors for LSP
  use "folke/lsp-colors.nvim"
end)

-- import individual plugin settings
require('plugins.bufferline')
require('plugins.compe')
require('plugins.gitsigns')
require('plugins.lspinstall')
require('plugins.lspkind')
require('plugins.lspsaga')
require('plugins.lualine')
require('plugins.material')
require('plugins.symbols-outline')
require('plugins.telescope')
require('plugins.toggleterm')
require('plugins.tree')
require('plugins.treesitter')
require('plugins.trouble')
require('plugins.zen-mode')

-- disable git blamme by default
vim.g.gitblame_enabled = 0
-- enable autosave
vim.g.auto_save = 1

