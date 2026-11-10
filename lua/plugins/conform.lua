return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Używamy Prettiera dla YAML
        yaml = { "yamlfix" },
      },
      formatters = {
        yamlfix = {
          env = {
            YAMLFIX_COMMENTS_MIN_SPACES_FROM_CONTENT = "1",
            YAMLFIX_WHITELINES = "1",
            YAMLFIX_SECTION_WHITELINES = "1",
          },
        },
      },
    },
  },
}
