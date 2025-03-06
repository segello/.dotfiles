#!/bin/zsh

# Exit on error
set -e

echo "Starting setup..."

# Install Homebrew packages from Brewfile
if [[ -f ./Brewfile ]]; then
  echo "📦 Installing packages from Brewfile..."
  brew bundle --file=./Brewfile || true
else
  echo "⚠️  Brewfile not found!"
  exit 1
fi

echo "Installing TPM..."
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

echo "🔗 Creating symlinks for Git config..."
if [ -L "$HOME/.config" ] || [ -e "$HOME/.config" ]; then
  echo "⚠️  Removing existing ~/.config..."
  rm -rf "$HOME/.config"
fi
echo "✅ Creating symlink: ~/.config → ~/.dotfiles/.config"
ln -s "$HOME/.dotfiles/.config" "$HOME/.config"

# Check and remove ~/.zshrc if it exists
if [ -L "$HOME/.zshrc" ] || [ -e "$HOME/.zshrc" ]; then
  echo "⚠️  Removing existing ~/.zshrc..."
  rm -rf "$HOME/.zshrc"
fi
echo "✅ Creating symlink: ~/.zshrc → ~/.dotfiles/.zshrc"
ln -s "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"

# Symlink
ln -sf ~/.dotfiles/.config ~/.config
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

echo "✅ Setup complete!"

