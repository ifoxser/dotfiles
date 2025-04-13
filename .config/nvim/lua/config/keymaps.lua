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

----------------------------------------
-- File Type Specific Operations
----------------------------------------
-- Keymaps for different file type operations
-- Currently supports:
-- PlantUML (.puml, .plantuml, .pu, .uml): Generate diagrams
-- Markdown (.md): [Reserved for future implementation]
-- SVG (.svg): [Reserved for future implementation]
vim.keymap.set("n", "<C-p>", function()
  -- Get current file info
  local current_file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")

  -- File type specific operations
  if ext == "puml" or ext == "plantuml" or ext == "pu" or ext == "uml" then
    -- Execute plantuml command and get both output and return code
    local output = vim.fn.system(string.format('plantuml "%s"', current_file))
    output = output:gsub("\27%[[0-9;]*m", ""):gsub("%s+$", "") -- Remove ANSI escape sequences and trailing newline
    -- Notify with appropriate level based on return code (0 = success, non-zero = error)
    vim.notify(output, vim.v.shell_error == 0 and vim.log.levels.INFO or vim.log.levels.ERROR)
  elseif ext == "md" then
    -- Reserved for Markdown operations
    vim.notify("Markdown handling not implemented yet", vim.log.levels.WARN)
  elseif ext == "svg" then
    -- Reserved for SVG operations
    vim.notify("SVG handling not implemented yet", vim.log.levels.WARN)
  else
    vim.notify(string.format("No operation defined for file type: %s", ext), vim.log.levels.WARN)
  end
end, { desc = "File type specific operations" })
