local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

require("packer").startup(function(use)
  -- Lua plugin manager
  -- https://github.com/wbthomason/packer.nvim
  use({
    "wbthomason/packer.nvim",
    event = "VimEnter",
  })

  -- Theme
  -- https://github.com/Pocco81/Catppuccino.nvim
  use({
    "catppuccin/nvim",
    branch = "old-catppuccino",
    config = function()
      local cp = require("catppuccino")
      cp.setup({
        colorscheme = "neon_latte", -- or "catpuccino", or "light_melya"
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          lsp_trouble = true,
          lsp_saga = true,
          gitsigns = true,
          telescope = true,
          nvimtree = {
            enabled = true,
            show_root = true,
          },
          which_key = true,
          fern = true,
          barbar = true,
          bufferline = true,
        },
      })
      cp.load()
    end,
  })

  -- Top bar with currently open buffers
  -- https://github.com/romgrk/jarbar.nvim
  use({
    "romgrk/barbar.nvim",
    requires = "yamatsum/nvim-nonicons",
    event = "BufWinEnter",
    config = function()
      require("config.barbar")
    end,
  })

  -- automatically adjust shiftwidth and expandtab based on current file
  -- https://github.com/tpope/vim-sleuth
  use({
    "tpope/vim-sleuth",
    event = "BufEnter",
    config = function()
      vim.g.sleuth_automatic = 1
    end,
  })

  -- easy configuration for the LSP
  -- https://github.com/neovim/nvim-lspconfig
  use({
    "neovim/nvim-lspconfig",
    requires = {
      -- installer for LSP servers
      -- https://github.com/williamboman/nvim-lsp-installer
      "williamboman/nvim-lsp-installer",
    },
    event = "BufReadPre",
    config = function()
      require("config.lsp")
    end,
  })

  -- A pretty diagnostics, references, telescope results, quickfix, etc.
  -- https://github.com/folke/trouble.nvim
  use({
    "folke/lsp-trouble.nvim",
    config = function()
      require("config.trouble")
    end,
  })

  -- Navigate between matching treesitter items using %
  -- https://github.com/andymass/vim-matchup
  use({
    "andymass/vim-matchup",
    opt = true,
  })

  -- Nvim Treesitter configurations and abstraction layer
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("config.treesitter")
    end,
    run = ":TSUpdate",
  })

  -- Highlight other uses of word under symbol
  -- https://github.com/RRethy/vim-illuminate
  use({
    "RRethy/vim-illuminate",
    requires = { "nvim-treesitter/nvim-treesitter" },
    event = "BufRead",
  })

  -- Status line
  -- https://github.com/hoob3rt/lualine.nvim
  use({
    "hoob3rt/lualine.nvim",
    config = function()
      require("config.lualine")
    end,
  })

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      require("config.telescope")
    end,
  })

  -- Matching brackets
  -- https://github.com/windwp/nvim-autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
  })

  -- Togglable blame info for current line
  -- https://github.com/f-person/git-blame.nvim
  use({
    "f-person/git-blame.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opt = true,
    cmd = "GitBlameToggle",
  })

  -- Browse commits for given line
  -- https://github.com/rhysd/git-messenger.vim
  use({
    "rhysd/git-messenger.vim",
    event = { "BufReadPre", "BufNewFile" },
    opt = true,
    cmd = "GitMessenger",
  })

  -- Toggle comments
  -- https://github.com/b3nj5m1n/kommentary
  use({
    "b3nj5m1n/kommentary",
    event = { "BufReadPre", "BufNewFile" },
    opt = true,
    keys = { "gc", "gcc" },
  })

  -- Utils
  use({
    -- Quotes and paranthesis made simple
    -- https://github.com/tpope/vim-surround
    {
      "tpope/vim-surround",
      event = { "BufReadPre", "BufNewFile" },
    },
    -- Cool complementary pairs of mappings, e.g. ]e to swap with line below, etc.
    -- https://github.com/tpope/vim-unimpaired
    "tpope/vim-unimpaired",
    -- Allow '.' also for plugins, not just native commands
    -- https://github.com/tpope/vim-repeat
    "tpope/vim-repeat",
    -- Display number of search matches & current index
    -- https://github.com/google/vim-searchindex
    "google/vim-searchindex",
    -- Highlight only when searching
    "romainl/vim-cool",
    -- More text objects to work with
    -- https://github.com/wellle/targets.vim
    "wellle/targets.vim",
    -- Autosave, but in lua and better than the classic one
    -- https://github.com/Pocco81/AutoSave.nvim
    {
      "Pocco81/AutoSave.nvim",
      config = function()
        require("autosave").setup()
      end,
    },
    -- Search and replace accross multiple files
    -- https://github.com/brooth/far.vim
    "brooth/far.vim",
    -- Motion plugin
    -- https://github.com/ggandor/lightspeed.nvim
    {
      "ggandor/lightspeed.nvim",
      event = { "BufRead" },
    },
  })

  -- Tree file explorer
  -- https://github.com/kyazdani42/nvim-tree.lua
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "yamatsum/nvim-nonicons",
    config = function()
      require("config.tree")
    end,
  })

  -- icons
  -- https://github.com/yamatsum/nvim-nonicons
  use({
    "yamatsum/nvim-nonicons",
    {
      -- more icons and color options, requirement for nonicons
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup({ default = true })
      end,
    },
  })

  -- Gutter git signs
  -- https://github.com/lewis6991/gitsigns.nvim
  use({
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("config.gitsigns")
    end,
  })

  -- Easily find key bindings, also used to manage keybindings
  -- https://github.com/folke/which-key.nvim
  use({
    "folke/which-key.nvim",
    config = function()
      require("config.keys")
    end,
  })

  -- Completion
  -- https://github.com/hrsh7th/nvim-cmp
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end,
    wants = {
      "cmp-nvim-lsp",
      "cmp_luasnip",
      "cmp-buffer",
      "cmp-path",
      "friendly-snippets",
    },
    requires = {
      { "hrsh7th/cmp-copilot", after= "nvim-cmp"},
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "rafamadriz/friendly-snippets", after = "nvim-cmp" },
      {
        "L3MON4D3/LuaSnip",
        requires = {
          "saadparwaiz1/cmp_luasnip",
          "rafamadriz/friendly-snippets",
        },
        config = function()
          require("config.luasnip")
        end,
      },
      {
        -- Icons for completions
        "onsails/lspkind-nvim",
        config = function()
          require("lspkind").init()
        end,
      },
    },
  })

  -- Lsp Signature as you type
  -- https://github.com/ray-x/lsp_signature.nvim
  use({
    "ray-x/lsp_signature.nvim",
  })

  -- GitHub copilot in nvim
  -- https://github.com/github/copilot.vim
  use({
    "github/copilot.vim",
  })

  -- Languages
  use("google/vim-jsonnet")
  use("tsandall/vim-rego")
  use("ledger/vim-ledger")
  use("cespare/vim-toml")
end)

-- disable git blamme by default
vim.g.gitblame_enabled = 0
vim.g.copilot_enabled = 1
