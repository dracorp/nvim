return {
  "xu-cheng/brew.vim",
  -- ft = { "brew" }, -- Opcjonalnie: ładuj wtyczkę tylko dla typu 'brew'
  init = function()
    -- 1. Upewniamy się, że pliki o nazwie Brewfile są wykrywane jako typ 'brew'
    vim.filetype.add({
      filename = {
        ["Brewfile"] = "brew",
      },
    })

    -- 2. Ustawiamy commentstring specjalnie dla typu pliku 'brew'
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "brew",
      callback = function()
        vim.bo.commentstring = "# %s"
      end,
    })
  end,
}
