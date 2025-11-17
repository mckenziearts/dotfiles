<p align="center"><img src="art/banner-2x.png"></p>

> This repo is a fork of Dries Vints [dotfiles](https://github.com/driesvints/dotfiles)

## Introduction

This repository serves as my way to setup and maintain my development environment on **Linux** and **macOS**. It takes the effort out of installing everything manually and keeps my configuration versioned and synchronized across machines.

## Features

- 🐧 **Linux support** (Ubuntu/Debian-based)
- 🍎 **macOS support** (with Homebrew)
- 🔗 **Shared configuration** (Git, aliases, PATH)
- 📦 **Automatic installation** of development tools
- 🎨 **Oh My Zsh** with Spaceship theme
- ⚡ **Optimized** for PHP/Laravel development

## Quick Start

### Linux Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/mckenziearts/dotfiles.git ~/.dotfiles
   ```

2. Run the installation:
   ```bash
   ~/.dotfiles/linux/fresh.sh
   ```

3. Restart your terminal or reload your shell:
   ```bash
   source ~/.zshrc
   ```

### Mac Setup

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. Setup an SSH key by using one of the two following methods
   2.1. If you use 1Password, install it with the 1Password [SSH agent](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent) and sync your SSH keys locally.
   2.2. Otherwise [generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/mckenziearts/dotfiles/HEAD/macos/bin/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repository to `~/.dotfiles` with:
   ```bash
   git clone --recursive git@github.com:mckenziearts/dotfiles.git ~/.dotfiles
   ```

4. Run the installation:
   ```bash
   ~/.dotfiles/macos/fresh.sh
   ```

5. Start `Herd.app` and run its install process
6. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
7. Restart your computer to finalize the process

## Structure

```
.dotfiles/
├── config/
│   └── git/              # Shared Git configuration
│       ├── .gitconfig
│       └── .gitignore_global
├── linux/
│   ├── bin/              # Linux installation scripts
│   ├── aliases.zsh       # Linux-specific aliases
│   ├── fresh.sh          # Linux setup script
│   └── .zshrc            # Linux Zsh configuration
├── macos/
│   ├── bin/              # macOS installation scripts
│   ├── aliases.zsh       # macOS-specific aliases
│   ├── fresh.sh          # macOS setup script
│   ├── .zshrc            # macOS Zsh configuration
│   ├── Brewfile          # macOS apps to install
│   └── .mackup.cfg       # Mackup configuration (optional)
├── bin/
│   └── ssh.sh            # SSH key generation script
├── aliases.zsh           # Shared aliases (Git, Laravel, PHP, etc.)
├── path.zsh              # Shared PATH configuration
└── clone.sh              # Clone personal repositories
```

## What Gets Installed

### Linux

- **Zsh** and **Oh My Zsh**
- **Spaceship** prompt theme
- Zsh plugins (autosuggestions, syntax highlighting)
- Development tools (see `linux/bin/development.sh`)
- System binaries (see `linux/bin/binaries.sh`)

### Mac

- **Homebrew** package manager
- **Zsh** and **Oh My Zsh**
- **Spaceship** prompt theme
- Zsh plugins (autosuggestions, syntax highlighting)
- Apps from Brewfile (if exists)

### Both Systems

**Symbolic links created:**
- `~/.zshrc` → OS-specific .zshrc
- `~/.gitconfig` → `config/git/.gitconfig`
- `~/.gitignore_global` → `config/git/.gitignore_global`

**Loaded configurations:**
- Shared aliases (Git, Laravel, Composer, etc.)
- OS-specific aliases (update, install commands)
- Custom PATH configuration
- NVM for Node.js version management

## Customization

### Adding Shared Aliases

Edit [`aliases.zsh`](./aliases.zsh) to add aliases available on both Linux and macOS:

```bash
alias myalias="my command"
```

### Adding OS-Specific Aliases

- **Linux only:** Edit [`linux/aliases.zsh`](./linux/aliases.zsh)
- **macOS only:** Edit [`macos/aliases.zsh`](./macos/aliases.zsh)

### Customizing PATH

Edit [`path.zsh`](./path.zsh) to add directories to your PATH (shared across both OS).

### Git Configuration

Edit [`config/git/.gitconfig`](./config/git/.gitconfig) to customize your global Git settings.

### Installing macOS Apps

Edit [`macos/Brewfile`](./macos/Brewfile) to add/remove apps to install via Homebrew.

### Zsh Configuration

- **Linux:** Edit [`linux/.zshrc`](./linux/.zshrc)
- **macOS:** Edit [`macos/.zshrc`](./macos/.zshrc)

More info about customizing Oh My Zsh can be found [here](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization).

## Useful Aliases

### Git
```bash
gst           # git status
gc            # git checkout
commit        # git add . && git commit -m
push          # git push
pull          # git pull
nuke          # git clean -df && git reset --hard
```

### Laravel
```bash
artisan       # php artisan
fresh         # php artisan migrate:fresh --seed
tinker        # php artisan tinker
sail          # Laravel Sail
```

### Composer
```bash
ci            # composer install
cu            # composer update
cfresh        # rm -rf vendor/ composer.lock && composer install
```

### Navigation
```bash
dotfiles      # cd ~/.dotfiles
sites         # cd ~/Sites
projects      # cd ~/Sites/Projects
```

### Other
```bash
reloadshell   # source ~/.zshrc
c             # clear
```

## Thanks To...

I first got the idea for starting this project by visiting the [GitHub does dotfiles](https://dotfiles.github.io/) project. Both [Zach Holman](https://github.com/holman/dotfiles) and [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) were great sources of inspiration. [Sourabh Bajaj](https://twitter.com/sb2nov/)'s [Mac OS X Setup Guide](http://sourabhbajaj.com/mac-setup/) proved to be invaluable. Thanks to [@subnixr](https://github.com/subnixr) for [his awesome Zsh theme](https://github.com/subnixr/minimal)! Thanks to [Caneco](https://twitter.com/caneco) for the header in this readme.

In general, I'd like to thank every single one who open-sources their dotfiles for their effort to contribute something to the open-source community.
