require 'themaspai.core.global'
G.mapleader = ' '
G.maplocalleader = ' '

K.set({ 'i', 'v' }, 'hh', '<ESC>')
K.set({ 'i', 'v' }, 'HH', '<ESC>')

K.set('v', 'J', ':m \'>+1<CR>gv=gv')
K.set('v', 'K', ':m \'<-2<CR>gv=gv')

K.set('n', '<C-d>', '<C-d>zz')
K.set('n', '<C-u>', '<C-u>zz')

K.set('n', '<leader>n', '<C-u>zz')
K.set('n', '<leader>f', '<C-u>zz')

K.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

K.set('n', 'K', "v:count == 0 ? 'gk' : 'K'", { expr = true, silent = true })
K.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

K.set('t', '<ESC>', '<C-\\><C-n>')

-- Diagnostic keymaps
K.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
K.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
K.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
K.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


