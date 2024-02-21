require 'themaspai.core.global'

G.loaded = 1
G.loaded_netrwPlugin = 1
C([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
C [[autocmd BufEnter * NvimTreeRefresh]]

require 'nvim-tree'.setup {
  view = {
    width = 40,
  },
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
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = false,
  },
}
K.set('n', '<leader>t', ':NvimTreeToggle<CR>')
