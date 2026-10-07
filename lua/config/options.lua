-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.autoformat = false

-- Global `spell = true` loads the dictionary synchronously (~15ms at startup).
-- LazyVim's wrap_spell autocmd already enables it for text, markdown, gitcommit.
vim.opt.spelllang = { "en_us" }

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "bash"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = true -- Wrap lines
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "a"

vim.g.lazyvim_prettier_needs_config = true
vim.g.deprecation_warnings = true

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- File types
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.opt.compatible = false

local indent = 4
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true
-- vim.opt.number = false
-- vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.wildmode = "list:longest"
vim.opt.backspace = "indent,eol,start"
vim.opt.redrawtime = 100000
vim.opt.termguicolors = true
vim.o.completeopt = "menuone,noselect"

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = true,
  severity_sort = false,
  -- Diagnostic floating windows with borders
  float = {
    border = "rounded",
  },
})
