vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

require 'nvim-tree'.setup {
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = '>',
          arrow_open = 'v',
        }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      }
    }
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
}

vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
