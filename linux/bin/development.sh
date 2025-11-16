#!/bin/bash

# Visual Studio Code
if test ! $(which code); then
  echo "Installing Visual Studio Code..."
  curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt update
  sudo apt install -y code
fi

# GitHub CLI
if test ! $(which gh); then
  echo "Installing GitHub CLI..."
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
  sudo apt install -y gh
fi

# Node.js via NVM
if test ! $(which node); then
  echo "Installing Node.js via NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install --lts
  nvm use --lts
fi

# PHP 8.4 for Laravel development
if test ! $(which php) || ! php -v | grep -q "8.4"; then
  echo "Installing PHP 8.4..."
  sudo add-apt-repository ppa:ondrej/php -y
  sudo apt update
  sudo apt install -y php8.4 php8.4-xml php8.4-dom php8.4-simplexml php8.4-{cli,common,curl,zip,gd,mysql,mbstring,intl,bcmath,soap,readline,fpm,sqlite3,pgsql}
fi

# Composer
if test ! $(which composer); then
  echo "Installing Composer..."
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
  sudo chmod +x /usr/local/bin/composer
fi

# JetBrains Toolbox
if test ! $(which jetbrains-toolbox) && [ ! -d "/opt/jetbrains-toolbox-"* ]; then
  echo "Installing JetBrains Toolbox..."
  wget -O jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
  sudo tar -xzf jetbrains-toolbox.tar.gz -C /opt/
  sudo /opt/jetbrains-toolbox-*/jetbrains-toolbox &
  rm jetbrains-toolbox.tar.gz
fi

# Warp Terminal
if test ! $(which warp-terminal); then
  echo "Installing Warp Terminal..."
  wget -O warp.deb "https://releases.warp.dev/linux/v0.2024.10.29.08.02.stable_02/warp-terminal_0.2024.10.29.08.02.stable.02_amd64.deb"
  sudo dpkg -i warp.deb
  sudo apt-get install -f
  rm warp.deb
fi

# Install global Composer packages
composer global require laravel/installer
composer global require genesisweb/valet-linux-plus

# Docker
if test ! $(which docker); then
  echo "Installing Docker..."
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo usermod -aG docker $USER
fi

# mkcert
if test ! $(which mkcert); then
  echo "Installing mkcert..."
  curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
  chmod +x mkcert-v*-linux-amd64
  sudo mv mkcert-v*-linux-amd64 /usr/local/bin/mkcert
  mkcert -install
fi
