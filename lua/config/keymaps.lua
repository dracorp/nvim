-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<S-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<S-Down>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<S-Up>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<S-Right>", "<C-w>l", { desc = "Go to right window" })
