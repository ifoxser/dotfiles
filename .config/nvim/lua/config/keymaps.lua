-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "J", "4j", { desc = "Move down 4 lines" })
vim.keymap.set("n", "K", "4k", { desc = "Move up 4 lines" })
