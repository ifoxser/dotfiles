-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

----------------------------------------
-- Spell Check Autocommand Configuration
----------------------------------------
-- Create auto-command group for spell check settings
local spell_group = vim.api.nvim_create_augroup("SpellConfig", { clear = true })

-- Disable spell check when entering any buffer
vim.api.nvim_create_autocmd("BufEnter", {
  group = spell_group,
  callback = function()
    vim.opt.spell = false
  end,
})

----------------------------------------
-- Undotree Autocommand Configuration
----------------------------------------
-- Create auto-command group for undotree settings
local undotree_group = vim.api.nvim_create_augroup("UndotreeConfig", { clear = true })

-- When undotree window opens, close aerial window
vim.api.nvim_create_autocmd("FileType", {
  pattern = "undotree",
  group = undotree_group,
  callback = function()
    -- Close aerial window using its API
    require("aerial").close()
  end,
})
