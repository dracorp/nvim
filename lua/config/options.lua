-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.autoformat = false

-- nvim list options
vim.opt.spelllang = { "en_us", "pl" }
vim.opt.iskeyword:append("-", "#")
vim.opt.iskeyword:remove("$")
vim.opt.isfname:remove("=", ",")
vim.opt.isfname:append("{", "}")
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
-- vim.opt.formatoptions:append({ "r" })
vim.opt.formatoptions:append({ "1" })
-- vim.opt.formatoptions:append({ "o" })
vim.opt.formatoptions:remove({ "c" })
vim.opt.formatoptions:remove({ "t" })

-- nvim boolean options
vim.o.list = true
vim.o.tildeop = true
vim.o.showmode = true
vim.o.modeline = true
vim.o.title = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.copyindent = true
vim.o.backup = false
vim.o.showcmd = true
vim.o.cmdheight = 2
vim.o.laststatus = 3
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.joinspaces = false
vim.o.endoffile = true
vim.o.scrolloff = 10
vim.o.shell = "bash"
vim.o.inccommand = "split"
vim.o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.wrap = true -- Wrap lines
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.equalalways = true -- Windows are automatically made the same size after splitting
vim.o.splitkeep = "cursor"
vim.o.mouse = "a"

vim.g.lazyvim_prettier_needs_config = false
vim.g.deprecation_warnings = true

vim.g.lazyvim_mini_snippets_in_completion = true
-- File types
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.o.compatible = false

local indent = 4
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.shiftwidth = indent
vim.o.expandtab = true
-- vim.o.number = false
-- vim.o.relativenumber = false
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.wildmode = "list:longest,list:full"
vim.o.backspace = "indent,eol,start"
vim.o.redrawtime = 100000
vim.o.termguicolors = true
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
