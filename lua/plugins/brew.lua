---@diagnostic disable: undefined-global

return {
  {
    --- https://github.com/xu-cheng/brew.vim
    --- 🍺 Vim Syntax for Homebrew formulae
    "xu-cheng/brew.vim",
    -- ft = { "brew" }, -- Optional: Load on filetype 'brew' (Brewfile)
    init = function()
      -- Add filetype detection for Brewfile
      vim.filetype.add({
        filename = {
          ["Brewfile"] = "brew",
        },
      })

      -- Set commentstring for filetype 'brew'
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "brew",
        callback = function()
          vim.bo.commentstring = "# %s"
        end,
      })
    end,
  },
  {
    --- https://github.com/stevearc/aerial.nvim
    --- Neovim plugin for a code outline window
    "stevearc/aerial.nvim",
    opts = function(_, opts)
      local default_backends = opts.backends or { "treesitter", "lsp", "markdown", "asciidoc", "man" }

      opts.backends = {
        _ = default_backends,
        brew = { "brewfile" },
      }
      opts.filter_kind = {
        _ = opts.filter_kind,
        brew = false,
      }
      opts.brewfile = {
        update_delay = 300,
      }
    end,
  },
}
