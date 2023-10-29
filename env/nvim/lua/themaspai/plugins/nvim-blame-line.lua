require 'themaspai.core.global'

local nvim_blame_line_setup, _ = pcall(require, "nvim-blame-line")

if not nvim_blame_line_setup then
  C[[autocmd BufEnter * EnableBlameLine]]
end

