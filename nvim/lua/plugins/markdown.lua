return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", ft = "markdown", desc = "Markdown 描画の切り替え" },
    },
    opts = {},
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = "cd app && ./install.sh", -- ビルド済みバイナリを取得（Node.js 不要）
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "ブラウザでプレビュー" },
    },
  },
}
