# Dotfiles

A collection of configuration files for my Linux environment, focused on productivity, minimalism, and a streamlined terminal-centric workflow.

## 🖥️ Environment Overview

* **Operating System:** [e.g., Void Linux / Arch Linux]
* **Shell:** [e.g., Fish Shell]
* **Terminal Emulator:** [e.g., Alacritty / Kitty]
* **Editor:** [e.g., Neovim / Helix]
* **Window Manager:** [e.g., i3 / Sway / Hyprland]
* **Multiplexer:** [e.g., Tmux]

## 🚀 Quick Start

### Prerequisites

Ensure you have `git` and your preferred shell installed before proceeding.

### Installation

1. **Clone the repository:**
   ```bash
   git clone --depth 1 git@github.com:sibi0620/dotfiles.git ~/dotfiles
   cd ~/dotfiles
2. Deployment (Symlinking)

I recommend using GNU Stow to manage symlinks easily.
# Install stow (Void Linux)
sudo xbps-install -S stow


# Deploy configurations
stow fish
stow nvim

Alternatively, manual symlinking:
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish

