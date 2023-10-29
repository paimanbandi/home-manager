require 'themaspai.core.global'

require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return O.columns * 0.4
    end
  end,
  open_mapping = [[\\]],
  insert_mappings = true,
  terminal_mappings = true,
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "1",
  start_in_insert = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = O.shell,
})
