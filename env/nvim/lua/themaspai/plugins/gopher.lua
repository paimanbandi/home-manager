require 'themaspai.core.global'

require("gopher").setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests", -- also you can set custom command path
    impl = "impl",
    iferr = "iferr",
  },
}

K.set('n', '<leader>gta', ':GoTagAdd json<cr>')
K.set('n', '<leader>ife', ':GoIfErr<cr>')
