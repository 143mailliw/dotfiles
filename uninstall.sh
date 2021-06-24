#!/bin/bash
echo Unstowing directories...
stow -D -t $HOME -d ./packages/ alacritty
stow -D -t $HOME -d ./packages/ mpd
stow -D -t $HOME -d ./packages/ nvim
stow -D -t $HOME -d ./packages/ sway
stow -D -t $HOME -d ./packages/ waybar
stow -D -t $HOME -d ./packages/ wofi
