-- リーダーキー（lazy.nvim より前に設定する必要がある）
vim.g.mapleader = " "

vim.opt.number = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc00", bold = true })

local function highlights()
  -- 背景を透明にして Ghostty の background-opacity を効かせる
  for _, group in ipairs({
    "Normal", "NormalNC", "NormalFloat", "FloatBorder",
    "SignColumn", "LineNr", "EndOfBuffer",
  }) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg = nil
    hl.ctermbg = nil
    vim.api.nvim_set_hl(0, group, hl)
  end

  vim.api.nvim_set_hl(0, "ZenkakuSpace", { bg = "#7a3e3e" })
end
highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = highlights })
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
