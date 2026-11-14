return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false, -- 遅延読み込みすると `nvim .` で netrw が開いてしまう
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "ファイルツリーの開閉" },
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "ファイルツリーへ移動" },
  },
  opts = {
    close_if_last_window = true,
    window = {
      width = 30,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<cr>"] = "none",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = { ".git", ".DS_Store" },
      },
    },
  },
}
