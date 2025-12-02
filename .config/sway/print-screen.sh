#!/usr/bin/env sh

grim -g "$(slurp -o -c '#ff0000ff')" -t png - | wl-copy -t image/png
exec notify-send "Copied to clipboard"
