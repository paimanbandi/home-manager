local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

local k = vim.keymap

k.set({ 'i', 'v' }, 'hh', '<ESC>')
k.set({ 'i', 'v' }, 'HH', '<ESC>')

k.set('v', 'J', ':m \'>+1<CR>gv=gv')
k.set('v', 'K', ':m \'<-2<CR>gv=gv')

k.set('n', '<C-d>', '<C-d>zz')
k.set('n', '<C-u>', '<C-u>zz')

k.set('n', '<leader>n', '<C-u>zz')
k.set('n', '<leader>f', '<C-u>zz')

k.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

k.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
k.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
k.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
k.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
k.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
k.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- k.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
k.set('n', '<leader>ca', '<cmd>CodeActionMenu<cr>')
g.code_action_menu_window_border = 'single'
g.code_action_menu_show_details = false
g.code_action_menu_show_diff = true
g.code_action_menu_show_action_kind = false


k.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = '[G]oto [D]eclaration' })
