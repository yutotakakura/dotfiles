return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "ファイル名で検索" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "プロジェクト内を文字列検索" },
  },
  opts = function()
    local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }
    -- dotfiles など隠しファイルも対象にする（.git の中は除く）
    vim.list_extend(vimgrep_arguments, { "--hidden", "--glob", "!**/.git/*" })
    return {
      defaults = { vimgrep_arguments = vimgrep_arguments },
      pickers = {
        find_files = { find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" } },
      },
    }
  end,
}
