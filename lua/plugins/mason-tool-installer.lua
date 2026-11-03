return {
  {
    --- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    --- Install and upgrade third party tools automatically
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        -- Bash
        "bash-language-server",
        "shellcheck",
        "beautysh",
        "shellharden",
        -- "shfmt",

        -- Python
        "basedpyright",
        "ruff",
        "prettier",

        -- YAML / Docker Compose / Azure DevOps
        "yaml-language-server",

        -- Dockerfile
        "hadolint",
        "dockerfmt",

        -- Ansible
        "ansible-language-server",
        "ansible-lint",

        -- Jenkins / Groovy
        -- "groovy-language-server",

        -- Lua
        "lua-language-server",
        "stylua",

        -- Markdown
        "markdownlint-cli2",
        "markdown-toc",

        -- Makefile
        "checkmake",
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
    },
  },
}
