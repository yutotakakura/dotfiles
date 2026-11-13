-- リーダーキー（lazy.nvim より前に設定する必要がある）
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true

-- 現在行の行番号を強調表示
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc00", bold = true })

-- 背景を透明にして Ghostty の background-opacity を効かせる
local function transparent()
  for _, group in ipairs({
    "Normal", "NormalNC", "NormalFloat", "FloatBorder",
    "SignColumn", "LineNr", "EndOfBuffer",
  }) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg = nil
    hl.ctermbg = nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end
transparent()
-- カラースキームを変えても透明を保つ
vim.api.nvim_create_autocmd("ColorScheme", { callback = transparent })

-- ウィンドウ移動（Ctrl+h で左のツリーへ、Ctrl+l で右のエディタへ）
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウへ" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウへ" })

-- プラグイン（lazy.nvim）
require("config.lazy")
