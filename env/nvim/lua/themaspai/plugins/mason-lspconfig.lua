require 'themaspai.core.global'

local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    K.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  -- dap
  nmap('<F5>', ":lua require('dap').toggle_breakpoint()<CR>", 'samain aja dulu')
  nmap('<F9>', ":lua require('dap').continue()<CR>", 'samain aja dulu')

  nmap('<F1>', ":lua require('dap').step_over()<CR>", 'samain aja dulu')
  nmap('<F2>', ":lua require('dap').step_into()<CR>", 'samain aja dulu')
  nmap('<F3>', ":lua require('dap').step_out()<CR>", 'samain aja dulu')

  nmap('<Leader>dsc', ":lua require('dap').continue()<CR>", 'samain aja dulu')
  nmap('<Leader>dsv', ":lua require('dap').step_over()<CR>", 'samain aja dulu')
  nmap('<Leader>dsi', ":lua require('dap').step_into()<CR>", 'samain aja dulu')
  nmap('<Leader>dso', ":lua require('dap').step_out()<CR>", 'samain aja dulu')

  nmap('<Leader>dhh', ":lua require('dap.ui.variables').hover()<CR>", 'samain aja dulu')

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },

  -- denols = function(opts)
  --   opts.root_dir = require('lspconfig.util').root_pattern('deno.json', 'deno.jsonc')
  --   return opts
  -- end,
  -- tsserver = function(opts)
  --   opts.root_dir = require('lspconfig.util').root_pattern 'package.json'
  --   return opts
  -- end,
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = L.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = T(servers),
}


--
-- mason_lspconfig.setup_handlers {
--   function(server_name)
--
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--       filetypes = (servers[server_name] or {}).filetypes,
--     }
--   end,
-- }
