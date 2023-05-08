require("insis").setup({})

-------------- NvimTree ---------------------------
-- NvimTree toggle
local cfg = require("insis").config
if cfg.nvimTree ~= nil and cfg.nvimTree.enable then
  keymap("n", cfg.nvimTree.keys.toggle, "<CMD>NvimTreeToggle<CR>")
end

-- NvimTree Autoclose
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
local autocmd = vim.api.nvim_create_autocmd
autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows
      for _, w in ipairs(invalid_win) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-------------- Neovide ---------------------------
-- Neovide专用设置
if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove NF Mono:h14"
  vim.opt.linespace = 3
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_cursor_animate_in_insert_mode = false
end

-------------- Sonokai ---------------------------
-- vim.g.sonokai_style = "shusia"
