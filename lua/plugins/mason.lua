return {
  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Bash
        "bash-language-server",
        "shellcheck",
        "beautysh",
        "shellharden",
        "shfmt",
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
        -- jenkins, groovy
        "groovy-language-server",
        -- lua
        "lua-language-server",
        "stylua",
        -- markdown
        "markdownlint-cli2",
        "markdown-toc",
      },
    },
  },
}
