require 'themaspai.core.global'

local lazypath = F.stdpath 'data' .. '/lazy/lazy.nvim'
if not LO.fs_stat(lazypath) then
  F.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', 
    lazypath,
  }
end
OO.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
  },
  { 'folke/which-key.nvim',  opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        K.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        K.set({ 'n', 'v' }, ']c', function()
          if W.diff then return ']c' end
          S(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
        K.set({ 'n', 'v' }, '[c', function()
          if W.diff then return '[c' end
          S(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
      end,
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      C.colorscheme 'onedark'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {
    },
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return F.executable 'make' == 1
        end,
      },
    },
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'mfussenegger/nvim-dap'
  },
  {
    'rcarriga/nvim-dap-ui'
  },
  {
    'leoluz/nvim-dap-go'
  },
  {
    'theHamsta/nvim-dap-virtual-text'
  },
  {
    'akinsho/toggleterm.nvim'
  },
  {
    'windwp/nvim-autopairs'
  },
  {
    'nvim-lua/plenary.nvim',
    'crispgm/nvim-go',
    'rcarriga/nvim-notify'
  },
  {
    'tveskag/nvim-blame-line'
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {}
  },
  {
  'Wansmer/treesj',
    keys = {
      '<space>m',
      '<space>j',
      '<space>s',
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('treesj').setup({})
    end,
  },
  {
    'mg979/vim-visual-multi', branch = 'master'
  },
  {
 'stevearc/oil.nvim'
  },
  {
    'folke/zen-mode.nvim',
  }
}, {})
