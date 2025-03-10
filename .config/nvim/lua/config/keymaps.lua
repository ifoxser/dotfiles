-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

----------------------------------------
-- Enhanced Movement
----------------------------------------
-- Helper function for enhanced movement
local function enhanced_movement(direction, count, default_multiplier, count_multiplier)
  local multiplier = vim.v.count == 0 and default_multiplier or count_multiplier
  vim.cmd(string.format("normal! %d%s", count * multiplier, direction))
end

-- Create more efficient movement with HJKL keys
-- Multiplies movement: default 4x, with count prefix 10x

-- Enhanced vertical movement (up/down)
vim.keymap.set({ "n", "v" }, "K", function()
  enhanced_movement("k", vim.v.count1, 4, 10)
end, { desc = "Move up 4 lines (10x with count)" })

vim.keymap.set({ "n", "v" }, "J", function()
  enhanced_movement("j", vim.v.count1, 4, 10)
end, { desc = "Move down 4 lines (10x with count)" })

-- Enhanced horizontal movement (left/right)
vim.keymap.set({ "n", "v" }, "H", function()
  enhanced_movement("h", vim.v.count1, 4, 10)
end, { desc = "Move left 4 chars (10x with count)" })

vim.keymap.set({ "n", "v" }, "L", function()
  enhanced_movement("l", vim.v.count1, 4, 10)
end, { desc = "Move right 4 chars (10x with count)" })

----------------------------------------
-- Window Management
----------------------------------------
-- Keymaps for window operations

vim.keymap.set("n", "<leader>ww", "<C-w>q", { desc = "Quit a window" })

----------------------------------------
-- Buffer Operations
----------------------------------------
-- Keymaps for buffer content manipulation

vim.keymap.set("n", "<leader>v", "ggVG", { desc = "Select entire buffer content" })

----------------------------------------
-- Formatting Controls
----------------------------------------
-- Custom formatting keybindings. Alt + f to manually trigger formatting

vim.keymap.set({ "n", "v" }, "<A-f>", function()
  require("lazyvim.util").format({ force = true })
end, { desc = "Format" })
