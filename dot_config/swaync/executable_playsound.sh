#!/usr/bin/env bash

echo "$(date) args: $*" >> /tmp/playsound.log

play() {
  command play "$1" >>/tmp/playsound.log 2>&1
}

case "$1" in
  silent)
    exit 0
    ;;
  critical)
    play ~/.config/swaync/sounds/dialog-error-serious.oga
    ;;
  discord)
    play ~/.config/swaync/sounds/message-new-instant.oga
    ;;
  low)
    play ~/.config/swaync/sounds/dialog-information.oga
    ;;
  default)
    play ~/.config/swaync/sounds/completion-success.oga
    ;;
esac
