#!/usr/bin/env bash

# Save focused window
focused=$(swaymsg -t get_tree |
    jq -r '.. | objects | select(.focused? == true) | .id' |
    head -n1)

# Move focus to the parent container containing the workspace's windows
swaymsg focus parent

# Toggle that container between stacking and horizontal split
swaymsg layout toggle stacking splith

# Restore the original focused window
swaymsg "[con_id=$focused] focus"
