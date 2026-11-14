return {
  "saghen/blink.cmp",
  version = "1.*", -- リリース版ならビルド済みバイナリが使える（Rust 不要）
  event = "InsertEnter",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    completion = { documentation = { auto_show = true } },
    signature = { enabled = true },
    sources = { default = { "lsp", "path", "buffer" } },
  },
}
