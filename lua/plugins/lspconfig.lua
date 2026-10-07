return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      document_highlight = {
        enabled = false,
      },
      servers = {
        bashls = {},
        basedpyright = {},
        yamlls = {},
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
