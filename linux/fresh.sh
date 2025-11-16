#!/bin/sh

DOTFILES_DIR="$HOME/.dotfiles"
LINUX_DIR="$DOTFILES_DIR/linux"

echo "🚀 Setting up your Linux system..."

# Update package lists
echo "📦 Updating package lists..."
sudo apt update

# Install Zsh and Oh My Zsh setup
echo "🐚 Setting up Zsh and Oh My Zsh..."

# Install Zsh if we don't have it
if test ! $(which zsh); then
  echo "Installing Zsh..."
  sudo apt install -y zsh
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing Oh My Zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --unattended

  # Set zsh as default shell
  chsh -s $(which zsh)
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
ln -s $HOME/.dotfiles/linux/.zshrc $HOME/.zshrc

echo "⚙️  Linking Git configuration..."
[ -e $HOME/.gitconfig ] && rm $HOME/.gitconfig
[ -e $HOME/.gitignore_global ] && rm $HOME/.gitignore_global
ln -s $HOME/.dotfiles/config/git/.gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/config/git/.gitignore_global $HOME/.gitignore_global

# Run installation scripts
echo "🛠️  Installing applications from Linuxfile..."

if [ -f "$LINUX_DIR/bin/binaries.sh" ]; then
  echo "Installing system binaries..."
  bash "$LINUX_DIR/bin/binaries.sh"
fi

if [ -f "$LINUX_DIR/bin/development.sh" ]; then
  echo "Installing development tools..."
  bash "$LINUX_DIR/bin/development.sh"
fi

# Create a Sites directory
mkdir $HOME/Sites

# Create sites subdirectories
mkdir $HOME/Sites/ShopperLabs
mkdir $HOME/Sites/Laravelcm
mkdir $HOME/Sites/OSS
mkdir $HOME/Sites/Projects

# Clone Github repositories
$DOTFILES_DIR/clone.sh

echo ""
echo "✅ Fresh Linux setup completed!"
echo "💡 Please restart your terminal or run 'source ~/.zshrc' to apply changes."
