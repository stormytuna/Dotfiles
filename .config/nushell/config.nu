$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.table.mode = "thin"

# NixOS update stuff
def update-system [] {
  cd ~/.nixos
  git add .
  nh os switch . -- --max-jobs 3 --accept-flake-config

  if ($env.LAST_EXIT_CODE == 0) {
    notify-send "System updated!" --urgency "LOW"
  } else {
    notify-send "System update failed" --urgency "CRITICAL"
  }

  cd -
}

def update-flake [] { sudo nix flake update --flake ~/.nixos; update-system }

alias us = update-system
alias uf = update-flake

# git
alias gs = git status
alias gc = git commit --message
alias ga = git add --all
alias gp = git push
alias gpl = git pull
alias .git = git --git-dir=/home/stormytuna/.dotfiles --work-tree=/home/stormytuna

# misc stuff
def lg [path = "."] { ls $path | sort-by type name --ignore-case | grid --icons --color } # Quick filename view of directory
def l [path = "."] { ls $path | sort-by type name --ignore-case }
def ll [path = "."] { ls --long $path | sort-by type name --ignore-case | select mode user group type name size created accessed modified }
def la [path = "."] { ls --long --all $path | sort-by type name --ignore-case | select mode user group type name size created accessed modified }

def qvf [] { let owd = pwd; cd ~/.nixos; nvim; cd $owd }

def .gc [message] { .git add -u; .git commit --message $message; .git push }

alias cl = clear
alias v = nvim

# enable starship
$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# Enable zoxide
source ./zoxide.nu
