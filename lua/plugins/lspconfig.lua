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
      },
    },
  },
}
