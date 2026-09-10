# aldrsze's Dotfiles

My personal configuration files for Arch Linux running i3wm.

## Configurations Included
- **Window Manager**: i3wm (`.config/i3`)
- **Status Bar**: Polybar (`.config/polybar`)
- **Terminal Emulator**: Alacritty (`.config/alacritty`)
- **App Launcher**: Rofi (`.config/rofi`)
- **System Monitor**: Btop (`.config/btop`)
- **Audio Visualizer**: Cava (`.config/cava`)
- **Text Editors**: Vim & Neovim (`.vim`, `.config/nvim`)
- **Shell & Init**: Bash (`.bashrc`) & Xinit (`.xinitrc`)

## How to Install/Restore

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
   ```
2. Copy the files/directories to your home directory (or symlink them as desired):
   ```bash
   # Back up your existing files first!
   # Then copy the configurations over:
   cp ~/dotfiles/.bashrc ~/.bashrc
   cp ~/dotfiles/.xinitrc ~/.xinitrc
   cp -r ~/dotfiles/.vim ~/.vim
   cp -r ~/dotfiles/.config/* ~/.config/
   ```
