require 'themaspai.core.global'

local ufo = require('ufo')
ufo.setup({
   provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end})

O.foldcolumn = '2' -- '0' is not bad
O.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
O.foldlevelstart = 99
O.foldenable = true
O.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

K.set('n', '<leader>zo', ufo.openAllFolds)
K.set('n', '<leader>zc', ufo.closeAllFolds)
