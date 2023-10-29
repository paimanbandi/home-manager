require 'themaspai.core.global'
G.indentLine_char = '¦'

O.tabstop = 2
O.shiftwidth = 2
O.expandtab = true
O.autoindent = true
O.breakindent = true
O.smartindent = true
O.hlsearch = false

O.mouse = 'a'
O.clipboard = 'unnamedplus'
O.swapfile = false
O.undofile = true

O.ignorecase = true
O.smartcase = true
O.updatetime = 250
O.timeoutlen = 300
O.completeopt = 'menuone,noselect'
O.termguicolors = true

O.foldcolumn = '1' -- '0' is not bad
O.foldlevel = 99
O.foldlevelstart = 99
O.foldenable = true
O.foldmethod = 'syntax'

O.hidden = true
O.history = 1000
O.lazyredraw = true
O.synmaxcol = 240

O.number = true
O.signcolumn = 'yes'

local highlight_group = A.nvim_create_augroup('YankHighlight', { clear = true })
A.nvim_create_autocmd('TextYankPost', {
  callback = function()
    H.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
