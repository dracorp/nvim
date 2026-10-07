-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Spellcheck only in code filetypes (treesitter limits it to comments/strings).
-- Global `spell` is off because it loads the dictionary at startup.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("code_spell", { clear = true }),
  pattern = {
    "lua",
    "go",
    "rust",
    "sh",
  },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})
