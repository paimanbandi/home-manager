local k = vim.keymap
k.set('n', '<leader>ca', ':CodeActionMenu<CR>')

local g = vim.g
g.code_action_menu_window_border = 'single'
g.code_action_menu_show_details = false
g.code_action_menu_show_diff = true
g.code_action_menu_show_action_kind = false
