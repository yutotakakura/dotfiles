-- リーダーキー（lazy.nvim より前に設定する必要がある）
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true

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
vim.api.nvim_create_autocmd("ColorScheme", { callback = transparent })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウへ" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウへ" })

require("config.lazy")
