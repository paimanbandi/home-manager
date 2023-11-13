local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
