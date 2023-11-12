require("lspconfig").setup({
    opts = {
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  })
