local o = vim.o
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.hlsearch = false
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 250
o.timeoutlen = 300
o.completeopt = 'menuone,noselect'
o.termguicolors = true
o.foldcolumn = '1' -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true


local wo = vim.wo
wo.number = true
wo.signcolumn = 'yes'

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
 
