#!/bin/zsh

# Exit on error
set -e

echo "Starting setup..."

# Install Homebrew packages from Brewfile
if [[ -f ./Brewfile ]]; then
  echo "📦 Installing packages from Brewfile..."
  brew bundle --file=./Brewfile
else
  echo "⚠️  Brewfile not found!"
  exit 1
fi

# Symlink
echo "🔗 Creating symlinks for Git config..."
ln -sf ~/.dotfiles/.config ~/.config
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

echo "✅ Setup complete!"

