local k = vim.keymap

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>km', require('telescope.builtin').keymaps, { desc = 'Display [K]ey[M]aps' })
vim.keymap.set('n', '<leader>bf', require('telescope.builtin').buffers, { desc = 'Display [B]u[F]fers' })

-- dap
vim.keymap.set('n', "<leader>do", require('dapui').open, { desc = 'open dapui' })
vim.keymap.set('n', "<leader>di", require('dapui').toggle, { desc = 'Toggle dapui' })
vim.keymap.set('n', "<leader>dbt", require('dap').toggle_breakpoint, { desc = 'Toggle Breakpoint' })

vim.keymap.set('n', "<leader>dsc", require('dap').continue, { desc = 'Dap Continue' })
vim.keymap.set('n', "<leader>dsv", require('dap').step_over, { desc = 'Dap Step Over' })
vim.keymap.set('n', "<leader>dsi", require('dap').step_into, { desc = 'Dap Step Into' })
vim.keymap.set('n', "<leader>dso", require('dap').step_out, { desc = 'Dap Step Out' })

vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

k.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[g]oto [r]eferences' })
k.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
k.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = '[G]oto [D]eclaration' })

k.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
k.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
