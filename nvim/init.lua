-- リーダーキー（lazy.nvim より前に設定する必要がある）
vim.g.mapleader = " "

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

local function zenkaku_space()
  vim.api.nvim_set_hl(0, "ZenkakuSpace", { bg = "#7a3e3e" })
end
zenkaku_space()
vim.api.nvim_create_autocmd("ColorScheme", { callback = zenkaku_space })
vim.api.nvim_create_autocmd({ "VimEnter", "WinNew" }, {
  callback = function()
    if not vim.w.zenkaku_match then
      vim.w.zenkaku_match = vim.fn.matchadd("ZenkakuSpace", "　")
    end
  end,
})

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウへ" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウへ" })

require("config.lazy")
