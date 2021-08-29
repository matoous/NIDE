local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require("packer").startup(function(use)
  -- Lua plugin manager
  -- https://github.com/wbthomason/packer.nvim
  use({"wbthomason/packer.nvim"})

  -- Theme
  -- https://github.com/Pocco81/Catppuccino.nvim
  use({
    "Pocco81/Catppuccino.nvim",
    config = function()
      local cp = require("catppuccino")
      cp.setup({
        colorscheme = "neon_latte", -- or "catpuccino", or "light_melya"
        integrations = {
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
          bufferline = true,
        }
      })
      cp.load()
    end,
  })

  -- line with currently open buffers
  -- https://github.com/akinsho/bufferline.nvim
  use({
    "akinsho/bufferline.nvim",
    requires = "yamatsum/nvim-nonicons",
    config = function()
      require("config.bufferline")
    end,
  })

  -- highlight other uses of word under symbol
  -- https://github.com/RRethy/vim-illuminate
  use({
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
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
      "kabouzeid/nvim-lspinstall",
    },
    event = "BufReadPre",
    config = function()
      require("config.lsp")
    end,
  })

  -- A pretty diagnostics, references, telescope results, quickfix, etc.
  use({
    "folke/lsp-trouble.nvim",
    config = function()
      require("config.trouble")
    end,
  })

  -- Nvim Treesitter configurations and abstraction layer
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("config.treesitter")
    end,
  })

    -- Status line
  -- https://github.com/hoob3rt/lualine.nvim
  use({
    "hoob3rt/lualine.nvim",
    requires = {
      -- lsp diagnostics status in lualine
      -- https://github.com/nvim-lua/lsp-status.nvim
      "nvim-lua/lsp-status.nvim",
    },
    config = function()
      require("config.lualine")
    end,
  })

  -- Open terminal window from within vim
  use({
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("config.toggleterm")
    end,
  })

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("config.telescope")
    end,
  })

  -- Togglable blame info for current line
  -- https://github.com/f-person/git-blame.nvim
  use({
    "f-person/git-blame.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- disable git blamme by default
      vim.g.gitblame_enabled = 0
    end,
    opt = true,
  })


  -- Utils
  use({
    -- Quotes and paranthesis made simple
    -- https://github.com/tpope/vim-surround
    {
      "tpope/vim-surround",
      event = { "BufReadPre", "BufNewFile" },
    },
    -- Toggle comments
    -- https://github.com/tpope/vim-commentary
    {
      "tpope/vim-commentary",
      event = { "BufReadPre", "BufNewFile" },
      opt = true,
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
    { "Pocco81/AutoSave.nvim", config = function() require("autosave").setup() end },
  })

  -- Tree file explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "yamatsum/nvim-nonicons",
    config = function()
      require("config.tree")
    end,
  })

  -- icons
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

  -- Cool popup windows for certain LSP features (definitions, references, etc.), currently in development
  -- https://github.com/glepnir/lspsaga.nvim
  use({
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga",
    config = function()
      require("config.lspsaga")
    end,
  })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end,
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-calc", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      {
        "hrsh7th/vim-vsnip",
        event = "InsertCharPre",
        requires = {
          { "hrsh7th/cmp-vsnip" },
        },
        config = function()
          vim.g.vsnip_snippet_dir = os.getenv "HOME" .. "/.config/nvim/snippets"
        end,
      },
      { 
        "L3MON4D3/LuaSnip",
        requires = {
          'saadparwaiz1/cmp_luasnip',
        },
      },
      {
        -- Icons for completions
        "onsails/lspkind-nvim",
        config = function()
          require('lspkind').init()
        end,
      },
    },
  })

  -- Languages
  use "google/vim-jsonnet"
  use "tsandall/vim-rego"
  use "ledger/vim-ledger"
  use "cespare/vim-toml"
end)


