-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<S-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<S-Down>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<S-Up>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<S-Right>", "<C-w>l", { desc = "Go to right window" })

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Language profile
keymap.set("n", "<leader>P", "<cmd>Profile<cr>", { desc = "Manage language profile" })

-- Moving text
-- Move text up and down
keymap.set("n", "<C-Down>", "<Esc>:m .+1<CR>", opts)
keymap.set("n", "<C-Up>", "<Esc>:m .-2<CR>", opts)
keymap.set("v", "<C-Down>", ":m .+1<CR>", opts)
keymap.set("v", "<C-Up>", ":m .-2<CR>", opts)
keymap.set("x", "<C-Down>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<C-Up>", ":move '<-2<CR>gv-gv", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)
