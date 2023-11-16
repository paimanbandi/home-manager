require("flutter-tools").setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded",
    -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
    -- please note that this option is eventually going to be deprecated and users will need to
    -- depend on plugins like `nvim-notify` instead.
    notification_style = 'native'
  },
  dev_log = {
    enabled = true,
    notify_errors = false, -- if there is an error whilst running then notify the user
    open_cmd = "tabedit",  -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false,         -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false    -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
  }
}

K.set('n', '<leader>fr', ':FlutterRun<cr>')
K.set('n', '<leader>fd', ':FlutterDevices<cr>')
K.set('n', '<leader>fl', ':FlutterReload<cr>')
K.set('n', '<leader>fq', ':FlutterQuit<cr>')
K.set('n', '<leader>ft', ':FlutterOutlineToggle<cr>')
K.set('n', '<leader>fm', ':FlutterDevTools<cr>')
