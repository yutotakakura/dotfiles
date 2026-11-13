-- 行番号の左に git の差分（追加・変更・削除）を表示
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.opt.signcolumn = "yes" -- 印の列を常に表示して、表示が左右にずれないようにする
  end,
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
      end
      map("]c", function() gs.nav_hunk("next") end, "次の変更箇所へ")
      map("[c", function() gs.nav_hunk("prev") end, "前の変更箇所へ")
      map("<leader>gp", gs.preview_hunk, "変更内容をプレビュー")
      map("<leader>gr", gs.reset_hunk, "変更を元に戻す")
      map("<leader>gb", gs.blame_line, "この行の blame を表示")
    end,
  },
}
