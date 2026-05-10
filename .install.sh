#!/bin/bash
set -e

# Xcode CLI tools
echo "Installing Xcode CLI tools..."
xcode-select --install 2>/dev/null
until xcode-select -p &>/dev/null; do sleep 5; done

# Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Packages
echo "Installing packages..."
brew install neovim tmux fzf ripgrep starship zsh uv tree-sitter tree-sitter-cli rustup node
brew install --cask ghostty font-commit-mono-nerd-font

# Rust toolchain
echo "Setting up Rust..."
rustup-init -y
source "$HOME/.cargo/env"

# Language servers
echo "Installing language servers..."
npm install -g pyright
rustup component add rust-analyzer

# Dotfiles (before nvim config so TSInstall can find it)
echo "Setting up dotfiles..."
git clone --bare git@github.com:williamsnsung/dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# Neovim treesitter parsers
echo "Running TSInstall..."
nvim --headless -c "TSInstall rust python" -c "qall"

echo "Done! Restart your terminal."
