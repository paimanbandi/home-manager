local nvim_blame_line_setup, _ = pcall(require, "nvim-blame-line")

if not nvim_blame_line_setup then
	local cmd = vim.cmd
  cmd[[autocmd BufEnter * EnableBlameLine]]
end

