## Dotfiles

Personal configuration for i3.

These files exist on Arch-based but, should be compatible with any other distro. Adjust paths or package names for other distributions as needed.

### What's Included
- `alacritty/alacritty.toml`
- `i3/config`
- `picom/picom.conf`
- `polybar/` scripts and `config.ini`

### Prerequisites
- git - version control (obviously)
- pywal16 - color scheme changer
- picom - compositor
- polybar - bar
- i3 - window manager
- dunst - notification
- Alacritty - terminal emulator
- feh - background setter (used with pywal16)
- flameshot - screenshoter (you can use scrot, i just like this more)
- nm-applet - network manager
- dmenu - application launcher (use rofi if you want)

### Install Required Packages (Arch/CachyOS)
Use your preferred AUR helper or `pacman`. Minimal set:

```bash
sudo pacman -S --needed i3-wm alacritty picom polybar feh dmenu

# Fonts (for icons/glyphs in polybar)
sudo pacman -S --needed ttf-nerd-fonts-symbols-mono ttf-dejavu
```

Notes:
- You may want a full Nerd Font (e.g., `ttf-jetbrains-mono-nerd` from AUR) for better glyph coverage.
- For network/audio modules in polybar, ensure the appropriate services/tools are installed and running (e.g., NetworkManager, PipeWire/PulseAudio).

### Backup Any Existing Configs
Recommended before linking:

```bash
mkdir -p ~/.config_backup/{alacritty,i3,picom,polybar}
[ -f ~/.config/alacritty/alacritty.toml ] && cp ~/.config/alacritty/alacritty.toml ~/.config_backup/alacritty/
[ -f ~/.config/i3/config ] && cp ~/.config/i3/config ~/.config_backup/i3/
[ -f ~/.config/picom/picom.conf ] && cp ~/.config/picom/picom.conf ~/.config_backup/picom/
[ -d ~/.config/polybar ] && cp -r ~/.config/polybar/* ~/.config_backup/polybar/
```

### Link These Dotfiles Into ~/.config
From the repo root (`/home/argee/.dotfiles.git`), create target folders and symlink files:

```bash
# Alacritty
mkdir -p ~/.config/alacritty
ln -sf /home/argee/.dotfiles.git/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

# i3
mkdir -p ~/.config/i3
ln -sf /home/argee/.dotfiles.git/i3/config ~/.config/i3/config

# picom
mkdir -p ~/.config/picom
ln -sf /home/argee/.dotfiles.git/picom/picom.conf ~/.config/picom/picom.conf

# polybar (link entire directory or individual files)
mkdir -p ~/.config/polybar
ln -sf /home/argee/.dotfiles.git/polybar/config.ini ~/.config/polybar/config.ini
ln -sf /home/argee/.dotfiles.git/polybar/launch.sh ~/.config/polybar/launch.sh
ln -sf /home/argee/.dotfiles.git/polybar/battery_indicator.sh ~/.config/polybar/battery_indicator.sh
ln -sf /home/argee/.dotfiles.git/polybar/brightness.sh ~/.config/polybar/brightness.sh
chmod +x ~/.config/polybar/*.sh
```

(Or you can just copy and replace, make sure to have backup)

### Fonts and Glyphs
- Ensure your terminal and bar use a Nerd Font. For Alacritty, set the font family in `alacritty/alacritty.toml` to an installed Nerd Font.
- For polybar icons, verify the selected font in `polybar/config.ini` exists on your system.

### Starting Services and Usage
- i3: Select i3 at login; reload with `Mod+Shift+r`.
- picom: Start on login or via `picom --experimental-backends --config ~/.config/picom/picom.conf &`.
- polybar: Launch with `~/.config/polybar/launch.sh`. Consider autostarting from your i3 config.
- Alacritty: Run `alacritty`. Make it your default terminal if desired.

### Troubleshooting
- Missing icons/glyphs: Install a Nerd Font and update font settings in Alacritty/polybar.
- Polybar modules failing: Check dependencies for each module (network, audio) and adjust `config.ini`.
- picom issues: Try disabling certain effects or switching backends in `picom.conf`.
- Keybindings not working: Confirm i3 is active and reload with `Mod+Shift+r`. Check `~/.config/i3/config`.

### Repository Layout
```
/home/argee/.dotfiles.git/
  alacritty/alacritty.toml
  i3/config
  picom/picom.conf
  polybar/
    battery_indicator.sh
    brightness.sh
    config.ini
    config.ini.bak
    launch.sh
```

### License
Personal configuration; reuse at your own discretion.
