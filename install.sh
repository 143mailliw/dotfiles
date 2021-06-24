#!/bin/bash
echo Stowing files...
stow alacritty
stow nvim
stow sway
stow waybar
stow wofi
stow mpd

echo Creating directories...
mkdir -p /home/william341/.local/share/mpd/
