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
  require 'themaspai.plugins.colorscheme',
  require 'themaspai.plugins.typescript',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = true,
        opts = {
          ensure_installed = {
            "eslint-lsp",
          },
        }
      },
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
  require 'themaspai.plugins.git',
  { 'nvim-lualine/lualine.nvim' },
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
  {
    'numToStr/Comment.nvim',
    opts = {
    },
    lazy = false,
  },
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
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  require 'themaspai.plugins.dap',
  {
    "olexsmir/gopher.nvim",
    requires = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  { 'akinsho/toggleterm.nvim' },
  { 'windwp/nvim-autopairs' },
  { 'nvim-lua/plenary.nvim',    'crispgm/nvim-go', 'rcarriga/nvim-notify' },
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
  { 'mg979/vim-visual-multi', branch = 'master' },
  { 'stevearc/oil.nvim' },
  { 'folke/zen-mode.nvim' },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },
  { 'kevinhwang91/nvim-ufo' },
  { 'kevinhwang91/promise-async' },
  { "luukvbaal/statuscol.nvim" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua'
  },
  {
    'jinh0/eyeliner.nvim'
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    }
  },
  {
    'dstein64/nvim-scrollview'
  },
  {
    "max397574/better-escape.nvim",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = {
      keymap = "<leader>dd"
    },
  },
  {
    'huy-hng/anyline.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = false,
    event = 'VeryLazy',
  },
}, {})
