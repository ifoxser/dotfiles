-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "K", function()
  local count = vim.v.count1
  local multiplier = vim.v.count == 0 and 4 or 10 -- Use 4 when no count is given, use 10 when count exists
  vim.cmd(string.format("normal! %dk", count * multiplier))
end, { desc = "Move up 4 lines" })

vim.keymap.set({ "n", "v" }, "J", function()
  local count = vim.v.count1
  local multiplier = vim.v.count == 0 and 4 or 10 -- Use 4 when no count is given, use 10 when count exists
  vim.cmd(string.format("normal! %dj", count * multiplier))
end, { desc = "Move down 4 lines" })

vim.keymap.set({ "n", "v" }, "H", function()
  local count = vim.v.count1
  local multiplier = vim.v.count == 0 and 4 or 10 -- Use 4 when no count is given, use 10 when count exist
  vim.cmd(string.format("normal! %dh", count * multiplier))
end, { desc = "Move left 4 chars" })

vim.keymap.set({ "n", "v" }, "L", function()
  local count = vim.v.count1
  local multiplier = vim.v.count == 0 and 4 or 10 -- Use 4 when no count is given, use 10 when count exists
  vim.cmd(string.format("normal! %dl", count * multiplier))
end, { desc = "Move right 4 chars" })

vim.keymap.set("n", "<leader>ww", "<C-w>q", { desc = "Quit a window" })
vim.keymap.set("n", "<leader>v", "ggVG", { desc = "Select entire buffer content" })
