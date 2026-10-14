return {
  --- https://github.com/xu-cheng/brew.vim
  "xu-cheng/brew.vim",
  -- ft = { "brew" }, -- Optional: Load on filetype 'brew' (Brewfile)
  init = function()
    -- Add filetype detection for Brewfile
    vim.filetype.add({
      filename = {
        ["Brewfile"] = "brew",
      },
    })

    -- set commentstring for filetype 'brew'
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "brew",
      callback = function()
        vim.bo.commentstring = "# %s"
      end,
    })
  end,
}
