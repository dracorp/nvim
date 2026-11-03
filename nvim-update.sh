#!/usr/bin/env bash
set -euo pipefail

# echo "==> LazyVim and plugins"
# nvim --headless "+Lazy! sync" +qa

echo "==> Mason"
nvim --headless \
    "+Lazy load mason.nvim" \
    "+MasonUpdate" \
    +qa

# echo "==> Treesitter"
# nvim --headless \
#     "+Lazy load nvim-treesitter" \
#     "+TSUpdate" \
#     +qa

echo "==> Update finished"
