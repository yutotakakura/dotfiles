-- 左側のファイルツリー
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false, -- `nvim .` でツリーを開けるように起動時に読み込む
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "ファイルツリーの開閉" },
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "ファイルツリーへ移動" },
  },
  opts = {
    close_if_last_window = true, -- ツリーだけ残ったら閉じる
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["l"] = "open",       -- ファイルを開く / ディレクトリを展開
        ["h"] = "close_node", -- ディレクトリを閉じる / 親ディレクトリへ移動
        ["<cr>"] = "none",   -- Enter では開かない
      },
    },
    filesystem = {
      follow_current_file = { enabled = true }, -- 開いているファイルをツリーで強調
      use_libuv_file_watcher = true,            -- ファイルの増減を自動反映
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = { ".git", ".DS_Store" },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- 起動時にツリーを開いてカーソルを移動
    local from_stdin = false
    vim.api.nvim_create_autocmd("StdinReadPre", {
      callback = function() from_stdin = true end,
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- 引数なしの `nvim` のときだけ開く
        -- （`nvim <ファイル>` では開かない。`nvim <ディレクトリ>` は neo-tree が自動で開く）
        if from_stdin or vim.fn.argc() > 0 then
          return
        end
        vim.cmd("Neotree focus")
      end,
    })
  end,
}
