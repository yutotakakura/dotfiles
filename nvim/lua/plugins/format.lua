return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    { "<leader>f", function() require("conform").format({ async = true }) end, desc = "フォーマット" },
  },
  opts = {
    formatters_by_ft = {
      go = { "goimports" },
    },
    format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
  },
}
