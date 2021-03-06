#!/bin/bash
echo Stowing files...
stow -t $HOME -d ./packages/ alacritty
stow -t $HOME -d ./packages/ nvim
stow -t $HOME -d ./packages/ sway
stow -t $HOME -d ./packages/ waybar
stow -t $HOME -d ./packages/ wofi
stow -t $HOME -d ./packages/ mpd
stow -t $HOME -d ./packages/ zsh 
stow -t $HOME -d ./packages/ dunst
stow -t $HOME -d ./packages/ kitty
stow -t $HOME -d ./packages/ environment

echo Creating directories...
mkdir -p /home/william341/.local/share/mpd/
