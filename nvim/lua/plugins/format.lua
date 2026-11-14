return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "フォーマット" },
  },
  opts = {
    formatters_by_ft = {
      go = { "goimports" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
    format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
  },
}
