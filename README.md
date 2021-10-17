# dotfiles
My set of dotfiles. Unfinished.

## Installation
Installation uses GNU stow, for easy updating and managment.

### Dependencies
`yay -S kitty mpd neovim-git python-neovim sway waybar wofi grim slurp wl-clipboard clipman stow node zsh ttf-hack powerline-fonts gnome-themes-extra polkit-gnome dunst wob swaylock nvim-packer-git fd ueberzug`

### Install
```bash
git clone --recurse-submodules https://github.com/143mailliw/dotfiles
cd dotfiles
./sync.sh # you should run this every pull
```
Updating also uses `sync.sh`.

### Uninstall
```
./uninstall.sh`
```
