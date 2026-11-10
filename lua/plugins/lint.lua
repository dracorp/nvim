return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        yaml = { "yamllint" },
      },
      linters = {
        yamllint = {
          args = {
            "-f",
            "parsable",
            "-c",
            function()
              local buffer_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
              return vim.fs.find({ ".yamllint", ".yamllint.yaml", ".yamllint.yml" }, {
                upward = true,
                path = buffer_dir,
              })[1] or (vim.fn.getcwd() .. "/.yamllint.yaml")
            end,
            "-",
          },
        },
      },
    },
  },
}
