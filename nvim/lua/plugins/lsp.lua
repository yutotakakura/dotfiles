local tools = {
  "gopls",
  "goimports",
}

return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    opts = { ensure_installed = tools },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup()

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            usePlaceholders = true,
            staticcheck = true,
            analyses = { unusedparams = true },
          },
        },
      })

      require("mason-lspconfig").setup({ automatic_enable = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "定義へジャンプ")
          map("gD", vim.lsp.buf.declaration, "宣言へジャンプ")
          map("gy", vim.lsp.buf.type_definition, "型定義へジャンプ")
          -- K, grr, gri, grn, gra は Neovim 標準のマッピング
        end,
      })
    end,
  },
}
