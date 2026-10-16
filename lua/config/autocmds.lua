-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
---@diagnostic disable: undefined-global
--
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Spellcheck only in code filetypes (treesitter limits it to comments/strings).
-- Global `spell` is off because it loads the dictionary at startup.
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("code_spell", { clear = true }),
--   pattern = {
--     "lua",
--     "go",
--     "rust",
--     "sh",
--   },
--   callback = function()
--     vim.opt_local.spell = true
--   end,
-- })

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Quit Neovim when Explorer is the last window
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local snacks_windows = {}
    local floating_windows = {}
    local windows = vim.api.nvim_list_wins()

    for _, win in ipairs(windows) do
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.bo[buf].filetype

      if ft:match("^snacks_") then
        table.insert(snacks_windows, win)
      elseif vim.api.nvim_win_get_config(win).relative ~= "" then
        table.insert(floating_windows, win)
      end
    end

    -- Jeżeli zamykane okno jest ostatnim normalnym oknem,
    -- zamknij również okna Snacks.
    if #windows - #floating_windows - #snacks_windows == 1 then
      for _, win in ipairs(snacks_windows) do
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end,
})
