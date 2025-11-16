#!/bin/bash

# Git - latest version from official PPA
if test ! $(which git); then
  echo "Installing latest Git..."
  sudo add-apt-repository ppa:git-core/ppa -y
  sudo apt update
  sudo apt install -y git
fi

# List of system binaries
BINARIES=(
  "curl"
  "wget"
  "vim"
  "nano"
  "htop"
  "tree"
  "unzip"
  "zip"
  "build-essential"
  "xsel"
  "libnss3-tools"
  "jq"
  "openssl"
  "ca-certificates"
  "lsb-release"
  "dnsmasq"
  "gnupg"
  "nginx"
  "fonts-jetbrains-mono"
  "pavucontrol" # PulseAudio Volume Control
)

# Install each binary if not already present
for binary in "${BINARIES[@]}"; do
  if ! dpkg -l | grep -q "^ii.*$binary "; then
    echo "Installing $binary..."
    sudo apt install -y "$binary"
  fi
done
