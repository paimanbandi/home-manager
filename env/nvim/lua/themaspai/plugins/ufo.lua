require 'themaspai.core.global'

local ufo = require('ufo')
ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})

O.foldcolumn = '2'
O.foldlevel = 99
O.foldlevelstart = 99
O.foldenable = true
O.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

K.set('n', '<leader>zo', ufo.openAllFolds)
K.set('n', '<leader>zc', ufo.closeAllFolds)
