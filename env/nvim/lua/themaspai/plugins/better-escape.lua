-- lua, default settings
require 'themaspai.core.global'
require("better_escape").setup {
  mapping = { "hh", "HH" },
  timeout = O.timeoutlen,
  clear_empty_lines = false,
  keys = "<Esc>",
}
