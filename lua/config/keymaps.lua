-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
---@diagnostic disable: undefined-global
local opts = { silent = true, noremap = true }
local map = vim.keymap.set
local wk = require("which-key")

-- Window navigation using Shift + Arrow keys
map("n", "<S-Left>", "<C-w>h", { desc = "Go to left window" }, opts)
map("n", "<S-Down>", "<C-w>j", { desc = "Go to lower window" }, opts)
map("n", "<S-Up>", "<C-w>k", { desc = "Go to upper window" }, opts)
map("n", "<S-Right>", "<C-w>l", { desc = "Go to right window" }, opts)

-- Move text up and down
map("n", "<A-Down>", "<Esc>:m .+1<CR>", { desc = "Move text down" }, opts)
map("n", "<A-Up>", "<Esc>:m .-2<CR>", { desc = "Move text up" }, opts)
map("v", "<A-Down>", ":m .+1<CR>", { desc = "Move text down" }, opts)
map("v", "<A-Up>", ":m .-2<CR>", { desc = "Move text up" }, opts)
map("x", "<A-Down>", ":move '>+1<CR>gv-gv", { desc = "Move text down" }, opts)
map("x", "<A-Up>", ":move '<-2<CR>gv-gv", { desc = "Move text up" }, opts)

-- Diagnostics
map("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Jump to next diagnostic" }, opts)
-- Create Dashboard command
vim.api.nvim_create_user_command("Dashboard", function()
  Snacks.dashboard()
end, { desc = "Open Snacks dashboard" })
vim.api.nvim_create_user_command("ShowHistory", function()
  Snacks.notifier.show_history()
end, { desc = "Show notification history" })

-- Own UI menu, @see ../plugins/which-key.lua
-- Leader key mappings
local my_own_menu = {
  { "<leader>P", "<cmd>Profile<cr>", desc = "Manage language profile", mode = "n" },
  { "<leader>sp", "<cmd>ShowHistory<cr>", desc = "Show notifs", mode = "n" },
  { "<leader>U", group = "UI my", icon = "󰙵 ", mode = "n" },
  { "<leader>UD", "<cmd>Dashboard<cr>", desc = "Show Dashboard", mode = "n" },
  { "<leader>UE", "<cmd>LazyExtras<cr>", desc = "Lazy Extras", mode = "n" },
  { "<leader>US", "<cmd>Lazy sync<cr>", desc = "Lazy sync", mode = "n" },
  { "<leader>UM", "<cmd>Mason<cr>", desc = "Mason", mode = "n" },
  { "<leader>C", group = "Copilot", icon = " ", mode = "n" },
  { "<leader>Cs", "<cmd>Copilot status<cr>", desc = "Copilot status", mode = "n" },
  { "<leader>Ct", "<cmd>Copilot panel<cr>", desc = "Copilot panel", mode = "n" },
  { "<leader>Cm", "<cmd>Copilot model<cr>", desc = "Copilot model", mode = "n" },
}
wk.add(my_own_menu)

-- Copy to OS clipboard
-- vim.keymap.set({ "n", "x" }, "y", '"+y', { desc = "Yank to system clipboard" })
-- Paste from OS clipboard
-- vim.keymap.set({ "n", "x" }, "p", '"+p')
-- vim.keymap.set({ "n", "x" }, "P", '"+P')
-- vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
-- vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- yy      → macOS clipboard
-- yw      → macOS clipboard
-- yap     → macOS clipboard
-- use P to paste from " registry
-- dd      → only registry Neovim "
-- dw      → only registry Neovim "
-- caw     → only registry Neovim "
-- x       → only registry Neovim "

-- "       unnamed register
-- 0       ostatni yank (yy, yw, etc.) "0p or "0P to paste
-- 1-9     historia usuniętego/zmienionego tekstu
-- a-z     nazwane rejestry użytkownika
-- +       systemowy clipboard
-- *       selection/system clipboard
-- _       black-hole register
-- then "ayy copy to a, "ap paste from a, "aP paste before from a
