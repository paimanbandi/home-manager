K.set('n', '<leader>gg', '<cmd>LazyGit<CR>')
K.set('n', '<leader>gc', '<cmd>LazyGitConfig<CR>')
K.set('n', '<leader>gf', '<cmd>LazyGitFilter<CR>')
K.set('n', '<leader>gh', '<cmd>LazyGitFilterCurrentFile<CR>')

C [[autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()]]
