-- require('lspconfig').setup {
--   opts = {
--     setup = {
--       tsserver = function(_, opts)
--         require('lazyvim.util').on_attach(function(client, _)
--           if client.name == 'tsserver' then
--             client.server_capabilities.documentFormattingProvider = false
--           end
--           --   local active_clients = vim.lsp.get_active_clients()
--           --   if client.name == 'denols' then
--           --     for _, client_ in pairs(active_clients) do
--           --       -- stop tsserver if denols is already active
--           --       if client_.name == 'tsserver' then
--           --         client_.stop()
--           --       end
--           --     end
--           --   elseif client.name == 'tsserver' then
--           --     for _, client_ in pairs(active_clients) do
--           --       -- prevent tsserver from starting if denols is already active
--           --       if client_.name == 'denols' then
--           --         client.stop()
--           --       end
--           --     end
--           --   end
--           if client.name == 'eslint' then
--             client.server_capabilities.documentFormattingProvider = true
--           end
--         end)
--         require('typescript').setup { server = opts }
--         return true
--       end,
--     },
--   },
-- }
-- local nvim_lsp = require('lspconfig')
-- nvim_lsp.denols.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }
--
-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("package.json"),
--   single_file_support = false
-- }
-- return {
--   lsp = {
--     config = {
--       denols = function(opts)
--         opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
--         return opts
--       end,
--       tsserver = function(opts)
--         opts.root_dir = require("lspconfig.util").root_pattern("package.json")
--         return opts
--       end,
--       -- For eslint:
--       -- eslint = function(opts)
--       --   opts.root_dir = require("lspconfig.util").root_pattern("package.json", ".eslintrc.json", ".eslintrc.js"),
--       --   return opts
--       -- end,
--     },
--   },
-- }

local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup{
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("package.json")
}
nvim_lsp.denols.setup {
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("deno.json"),

}
