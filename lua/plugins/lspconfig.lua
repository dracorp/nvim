return {
  {
    --- https://github.com/neovim/nvim-lspconfig
    --- Quickstart configs for Nvim LSP
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      document_highlight = {
        enabled = false,
      },
      servers = {
        bashls = {},
        basedpyright = {},
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = false,
              },
            },
          },
        },
        ansiblels = {},
        azure_pipelines_ls = {},
        gh_actions_ls = {},
        vimls = {},
        vimdoc_ls = {},
        tflint = {},
        stylua = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            },
          },
        },
      },
    },
  },
}
