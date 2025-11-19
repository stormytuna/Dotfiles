# My Dotfiles

These are miscellaneous configuration files for all the programs I use regularly. See [my NixOS configuration](https://github.com/stormytuna/NixOS) for the backbone that supports this.

## What I use and why

- **Window Manager:** [Sway](https://github.com/swaywm/sway). I love tiling window managers and Sway is the most stable one I've used. I use the [SwayFX](https://github.com/WillPower3309/swayfx) fork for blurred backgrounds and dropshadows (and hopefully transition anims soon!)

- **Status Bar:** [Waybar](https://github.com/Alexays/Waybar). There was a time when I dabbled with other solutions but they were overcomplicated and annoying to tweak. I like the simplicity of Waybar

- **Notification Daemon:** [Dunst](https://github.com/dunst-project/dunst). A notification daemon is necessary when running a window manager - Dunst is the first one I found that let me output notifs to a specific output.

- **Logout Menu:** [wlogout](https://github.com/ArtsyMacaw/wlogout). This _just about_ does the job so I have no reason to look for alternatives.

- **Terminal Emulator:** [Kitty](https://github.com/kovidgoyal/kitty). I started with this and haven't experimented much, only dipping my toes into [Alacritty](https://github.com/alacritty/alacritty) one time. I'd like to try [tmux](https://github.com/tmux/tmux) but I am in no rush.

- **Shell:** [Nushell](https://github.com/nushell/nushell). I have tried many shells in the past, settling on this one mainly for the pretty tables. It has a few annoyances and I'm likely going to switch whenever I find a way to have pretty tables in another shell (probably zsh).

- **Application Launcher:** [Fuzzel](https://codeberg.org/dnkl/fuzzel). I was trying this out and have decided to switch to [rofi](https://github.com/davatorium/rofi), I just haven't found the time to do that yet.

- **Editor:** [Neovim](https://github.com/neovim/neovim). The concept of vim motions has vastly increased the speed at which I can program, I highly recommend them to anyone who's not tried them. I'm also halfway through re-re-re-re-writing my Neovim configuration (aren't we all?) so there isn't much to see there yet.

- **Theme Management:** [Flavours](https://github.com/misterio77/flavours/). A CLI program that makes consistent theming across all my programs a breeze.

## What I *don't* use and why

I used to be a big fan of [home manager](https://github.com/nix-community/home-manager), the de facto program config management solution for NixOS. I've changed to this separated approach mainly due to how much I like to tinker, waiting 20+ seconds for tiny tweaks to my config became too much for me.

## Showcase

### Wallpaper switcher script

I spent way too long making a (nice looking) wallpaper switcher script with rofi.

<img width="3840" height="2160" alt="image" src="https://github.com/user-attachments/assets/882c8e3f-545f-42ee-93b7-7a4c56ff5493" />

Revevant code:
- [Script itself](https://github.com/stormytuna/Dotfiles/blob/main/.config/sway/change-wallpaper.sh)
- [Rofi theme file](https://github.com/stormytuna/Dotfiles/blob/main/.config/sway/change-wallpaper-rofi.rasi)
- [Invoking it with a keybind](https://github.com/stormytuna/Dotfiles/blob/7b0a0b6e512b6c4af206bf066493a93bc48cc90d/.config/sway/config#L108)

## How to use this

Don't! You can poke around my configs and steal stuff you like, but this isn't intended to be a me-flavoured distribution.

## What it looks like

Colours and background subject to change!

<img width="1079" height="1920" alt="image" src="https://github.com/user-attachments/assets/b99e9668-9edb-4354-abe5-f03cbec39747" />

<img width="3840" height="2160" alt="image" src="https://github.com/user-attachments/assets/10f63446-62d5-4b58-91e2-7b93c82320cc" />

<img width="3840" height="2160" alt="image" src="https://github.com/user-attachments/assets/9abd38a6-dc94-4319-bb97-8cc593ec911a" />

