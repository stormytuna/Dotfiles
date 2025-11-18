#!/usr/bin/env sh

chosen_wallpaper=$(for wallpaper in ~/.config/sway/wallpapers/*
  do echo -en "$wallpaper\0icon\x1f$wallpaper\n"
done | rofi -dmenu -show-icons -monitor 'HDMI-A-1' -config ~/.config/sway/change-wallpaper-rofi.rasi)

if [ -z ${chosen_wallpaper} ]; then 
  exit 0
fi

cp -f "$chosen_wallpaper" ~/.config/sway/current-wallpaper
swww img ~/.config/sway/current-wallpaper --transition-duration 2 --transition-type any --transition-step 255 --transition-fps 120
