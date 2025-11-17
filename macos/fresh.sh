#!/bin/sh

DOTFILES_DIR="$HOME/.dotfiles"
MACOS_DIR="$DOTFILES_DIR/macos"

echo "🚀 Setting up your Mac..."

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Install Homebrew if we don't have it
if test ! $(which brew); then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
echo "📦 Updating Homebrew..."
brew update

# Install Zsh and Oh My Zsh setup
echo "🐚 Setting up Zsh and Oh My Zsh..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing Oh My Zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --unattended
fi

# Install Oh My Zsh plugins
echo "Installing Oh My Zsh plugins..."

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Install Spaceship theme
echo "Installing Spaceship theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" ]; then
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1
  ln -s ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
fi

# Create symbolic links from oh-my-zsh plugins to dotfiles plugins directory
echo "🔗 Creating symbolic links for plugins..."
ln -sf $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions $HOME/.dotfiles/plugins/zsh-autosuggestions
ln -sf $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting $HOME/.dotfiles/plugins/zsh-syntax-highlighting

# Create symbolic link for theme
echo "🔗 Creating symbolic link for Spaceship theme..."
mkdir -p $HOME/.dotfiles/themes
ln -sf $HOME/.oh-my-zsh/custom/themes/spaceship-prompt $HOME/.dotfiles/themes/spaceship-prompt

# Link .zshrc configuration
echo "⚙️  Linking .zshrc configuration..."
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/macos/.zshrc $HOME/.zshrc

echo "⚙️  Linking Git configuration..."
[ -e $HOME/.gitconfig ] && rm $HOME/.gitconfig
[ -e $HOME/.gitignore_global ] && rm $HOME/.gitignore_global
ln -s $HOME/.dotfiles/config/git/.gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/config/git/.gitignore_global $HOME/.gitignore_global

# Install apps from Brewfile if it exists
if [ -f "$MACOS_DIR/Brewfile" ]; then
  echo "🛠️  Installing applications from Brewfile..."
  brew tap homebrew/bundle
  brew bundle --file="$MACOS_DIR/Brewfile"
fi

# Create a Sites directory
mkdir -p $HOME/Sites

# Create sites subdirectories
mkdir -p $HOME/Sites/ShopperLabs
mkdir -p $HOME/Sites/Laravelcm
mkdir -p $HOME/Sites/OSS
mkdir -p $HOME/Sites/Projects

# Clone Github repositories
$DOTFILES_DIR/clone.sh

# Symlink the Mackup config file to the home directory
ln -s $MACOS_DIR/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $MACOS_DIR/.macos

echo ""
echo "✅ Fresh macOS setup completed!"
echo "💡 Please restart your terminal or run 'source ~/.zshrc' to apply changes."
