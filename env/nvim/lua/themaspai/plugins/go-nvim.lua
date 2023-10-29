require 'themaspai.core.global'

local format_sync_grp = A.nvim_create_augroup("GoFormat", {})
A.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup()
require("go.format").goimport()  -- goimport + gofmt

