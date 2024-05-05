require 'themaspai.core.global'

require('telescope').setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = 'top',
    },
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
K.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
K.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
K.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

K.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
K.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
K.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
K.set('n', '<leader>st', function()
  require('telescope.builtin').grep_string();
end, { desc = '[S]earch current [W]ord' })
K.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
K.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
K.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
K.set('n', '<leader>km', require('telescope.builtin').keymaps, { desc = 'Display [K]ey[M]aps' })
K.set('n', '<leader>bf', require('telescope.builtin').buffers, { desc = 'Display [B]u[F]fers' })

-- dap
K.set('n', "<leader>do", require('dapui').open, { desc = 'open dapui' })
K.set('n', "<leader>di", require('dapui').toggle, { desc = 'Toggle dapui' })
K.set('n', "<leader>dt", require('dap').toggle_breakpoint, { desc = 'Toggle Breakpoint' })

K.set('n', "<leader>dsc", require('dap').continue, { desc = 'Dap Continue' })
K.set('n', "<leader>dsv", require('dap').step_over, { desc = 'Dap Step Over' })
K.set('n', "<leader>dsi", require('dap').step_into, { desc = 'Dap Step Into' })
K.set('n', "<leader>dso", require('dap').step_out, { desc = 'Dap Step Out' })

K.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
K.set('n', '<leader>B', function()
  require('dap').set_breakpoint(F.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

K.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[g]oto [r]eferences' })
K.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
K.set('n', 'gD', '<cmd>lua L.buf.declaration()<cr>', { desc = '[G]oto [D]eclaration' })

K.set('n', '<leader>D', L.buf.type_definition, { desc = 'Type [D]efinition' })
K.set('n', 'K', L.buf.hover, { desc = 'Hover Documentation' })
