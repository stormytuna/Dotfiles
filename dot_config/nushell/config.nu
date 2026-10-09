$env.path = ($env.path | prepend "/home/stormytuna/.scripts")

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.table.mode = "thin"
$env.editor = "nvim"

# NixOS update stuff
def update-system [] {
  cd ~/nixos
  git add .
  nh os switch . -H (hostname) -- --max-jobs 3 --accept-flake-config

  if ($env.LAST_EXIT_CODE == 0) {
    notify-send "System updated!" --urgency "LOW"
  } else {
    notify-send "System update failed" --urgency "CRITICAL"
  }

  cd -
}

def update-flake [] { 
    let owd = pwd
    cd ~/nixos

    sudo nix flake update --flake .

    let flakeLock = "./flake.lock"
    let hasChanged = (git status --porcelain -- $flakeLock | str trim | is-not-empty)
    if $hasChanged {
        git add -- $flakeLock
        git commit -m "chore: update flake" -- $flakeLock
    }

    cd $owd

    update-system 
}

def qvf [] { let owd = pwd; cd ~/nixos; nvim .; cd $owd }
def qvt [] { let owd = pwd; cd ~/ws/src/os/tModLoader/src/tModLoader; nvim .; cd $owd }
def qvv [] { let owd = pwd; cd ~/.config/nvim; nvim .; cd $owd }

alias uf = update-flake
alias us = update-system

# git
alias g = lazygit
alias gs = git status
alias gc = git commit --message
alias ga = git add --all
alias gp = git push
alias gpl = git pull
alias gu = git reset --soft HEAD~1

# chezmoi
alias ca = chezmoi apply
alias cu = chezmoi update
def cc [] { chezmoi re-add; chezmoi cd }

# ls shadows
# List the filenames, sizes, and modification times of items in a directory.
def l [
    --all (-a),         # Show hidden files
    --long (-l),        # Get all available columns for each entry (slower; columns are platform-dependent)
    --short-names (-s), # Only print the file names, and not the path
    --full-paths (-f),  # display paths as absolute paths
    --du (-d),          # Display the apparent directory size ("disk usage") in place of the directory metadata size
    --directory (-D),   # List the specified directory itself instead of its contents
    --mime-type (-m),   # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
    --threads (-t),     # Use multiple threads to list contents. Output will be non-deterministic.
    ...pattern: glob,   # The glob pattern to use.
]: [ nothing -> table ] {
    let pattern = if ($pattern | is-empty) { [ '.' ] } else { $pattern }
    (%ls
        --all=$all
        --long=$long
        --short-names=$short_names
        --full-paths=$full_paths
        --du=$du
        --directory=$directory
        --mime-type=$mime_type
        --threads=$threads
        ...$pattern
    ) | sort-by type name --ignore-case
}

def ll [
    --all (-a),         # Show hidden files
    --short-names (-s), # Only print the file names, and not the path
    --full-paths (-f),  # display paths as absolute paths
    --du (-d),          # Display the apparent directory size ("disk usage") in place of the directory metadata size
    --directory (-D),   # List the specified directory itself instead of its contents
    --mime-type (-m),   # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
    --threads (-t),     # Use multiple threads to list contents. Output will be non-deterministic.
    ...pattern: glob,   # The glob pattern to use.
]: [ nothing -> table ] {
    let pattern = if ($pattern | is-empty) { [ '.' ] } else { $pattern }
    (%ls
        --long
        --all=$all
        --short-names=$short_names
        --full-paths=$full_paths
        --du=$du
        --directory=$directory
        --mime-type=$mime_type
        --threads=$threads
        ...$pattern
    ) | sort-by type name --ignore-case | select mode user group type name size created accessed modified
}

def la [
    --short-names (-s), # Only print the file names, and not the path
    --full-paths (-f),  # display paths as absolute paths
    --du (-d),          # Display the apparent directory size ("disk usage") in place of the directory metadata size
    --directory (-D),   # List the specified directory itself instead of its contents
    --mime-type (-m),   # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
    --threads (-t),     # Use multiple threads to list contents. Output will be non-deterministic.
    ...pattern: glob,   # The glob pattern to use.
]: [ nothing -> table ] {
    let pattern = if ($pattern | is-empty) { [ '.' ] } else { $pattern }
    (%ls
        --long
        --all
        --short-names=$short_names
        --full-paths=$full_paths
        --du=$du
        --directory=$directory
        --mime-type=$mime_type
        --threads=$threads
        ...$pattern
    ) | sort-by type name --ignore-case | select mode user group type name size created accessed modified
}

def lg [
    --all (-a),         # Show hidden files
    --long (-l),        # Get all available columns for each entry (slower; columns are platform-dependent)
    --short-names (-s), # Only print the file names, and not the path
    --full-paths (-f),  # display paths as absolute paths
    --du (-d),          # Display the apparent directory size ("disk usage") in place of the directory metadata size
    --directory (-D),   # List the specified directory itself instead of its contents
    --mime-type (-m),   # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
    --threads (-t),     # Use multiple threads to list contents. Output will be non-deterministic.
    ...pattern: glob,   # The glob pattern to use.
]: [ nothing -> string ] {
    let pattern = if ($pattern | is-empty) { [ '.' ] } else { $pattern }
    (%ls
        --all=$all
        --long=$long
        --short-names=$short_names
        --full-paths=$full_paths
        --du=$du
        --directory=$directory
        --mime-type=$mime_type
        --threads=$threads
        ...$pattern
    ) | sort-by type name --ignore-case | grid --icons --color
}

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

# enable carapace
source ./carapace.nu

# enable zoxide
source ./zoxide.nu

# import color scheme
source ./colors.nu
