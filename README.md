# My Dotfiles

These are miscellaneous configuration files for all the programs I use regularly. See [my NixOS configuration](https://github.com/stormytuna/NixOS) for the backbone that supports this.

I manage dotfiles with [chezmoi](https://www.chezmoi.io/). After using it for some time, I do not recommend it unless you intend to make use of templating. The workflow is quite clunky, and I am not a fan of having things stored in two places at once. The templating feature is incredibly powerful, it's worth the clunkiness of chezmoi simply for it.

## What I use and why

- **Window Manager:** [Sway](https://github.com/swaywm/sway). I love tiling window managers and Sway is the most stable one I've used. I use the [SwayFX](https://github.com/WillPower3309/swayfx) fork for... no good reason now. I used to use it for blurred backgrounds, but I have since removed those. In the future I may switch back to vanilla Sway.

- **Status Bar:** [Waybar](https://github.com/Alexays/Waybar). There was a time when I dabbled with other solutions but they were overcomplicated and annoying to tweak. I like the simplicity of Waybar.

- **Notification Daemon:** [Dunst](https://github.com/dunst-project/dunst). A notification daemon is necessary when running a window manager - Dunst is the first one I found that let me output notifications to a specific output. It also supports running scripts when notifications are received, allowing me to configure notification sounds very easily.

- **Logout Menu:** [wlogout](https://github.com/ArtsyMacaw/wlogout). This is a great tool, after I configured it to look pretty. My configuration uses with [swaylock](https://github.com/swaywm/swaylock) for locking my screen.

- **Terminal Emulator:** [Kitty](https://github.com/kovidgoyal/kitty). I started with Kitty and haven't experimented much, only dipping my toes into [Alacritty](https://github.com/alacritty/alacritty) one time. I'd like to try [tmux](https://github.com/tmux/tmux) but I am in no rush.

- **Shell:** [Nushell](https://github.com/nushell/nushell). I have tried many shells in the past, settling on this one *entirely* for prettier tables. I use [Carapace](https://carapace.sh/) for a nicer completion engine, and [zoxide](https://github.com/ajeetdsouza/zoxide) as a replacement for `cd`.

- **Application Launcher:** [Fuzzel](https://codeberg.org/dnkl/fuzzel). I've tried a handful of application launchers in the past, settling on Fuzzel for reasons I've since forgotten.

- **Editor:** [Neovim](https://github.com/neovim/neovim). The concept of vim motions has vastly increased the fun I have when programming, I highly recommend them to anyone who's not tried them. If you dislike the ordering (count-command-motion) or lengthy configuration process, give [Helix](https://helix-editor.com/) a try.

- **Theme Management:** [Flavours](https://github.com/misterio77/flavours/). A CLI program that makes consistent theming across all my programs a breeze.

## What I *don't* use and why

I used to be a big fan of [home manager](https://github.com/nix-community/home-manager), the de facto program config management solution for NixOS. I've changed to this separated approach mainly due to how much I like to tinker. Since my home manager configuration included all the packages my user needed, I would often be stuck waiting upwards of half an hour for packages to download/build, or if they were up-to-date, I'd find myself waiting a minute for the configuration to rebuild anyway.

## Showcase

### Wallpaper switcher script

I spent way too long making a (nice looking) wallpaper switcher script with rofi.

<img width="3840" height="2160" alt="image" src="https://github.com/user-attachments/assets/882c8e3f-545f-42ee-93b7-7a4c56ff5493" />

Revevant code:
- [Script itself](https://github.com/stormytuna/Dotfiles/blob/3186e234e4b07d8944ba52ba6482a4e356043a4a/dot_config/sway/scripts/executable_change-wallpaper.sh)
- [Rofi theme file](https://github.com/stormytuna/Dotfiles/blob/3186e234e4b07d8944ba52ba6482a4e356043a4a/dot_config/sway/scripts/change-wallpaper-rofi.rasi)
- [Invoking it with a keybind](https://github.com/stormytuna/Dotfiles/blob/3186e234e4b07d8944ba52ba6482a4e356043a4a/dot_config/sway/config#L86)

## How to use this

Don't! You can poke around my configs and steal stuff you like, but this isn't intended to be a me-flavoured distribution.

## What it looks like

Colours and background subject to change!

My left monitor (vertical, 1080p, 16:9).

<img width="1079" height="1920" alt="image" src="https://github.com/user-attachments/assets/b99e9668-9edb-4354-abe5-f03cbec39747" />

<img width="3840" height="2160" alt="image" src="https://github.com/user-attachments/assets/10f63446-62d5-4b58-91e2-7b93c82320cc" />

<img width="3840" height="2160" alt="image" src="https://github.com/user-attachments/assets/9abd38a6-dc94-4319-bb97-8cc593ec911a" />

