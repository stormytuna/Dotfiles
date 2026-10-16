#carapace _carapace nushell | save --force ~/.config/nushell/carapace.nu
zoxide init nushell | save --force ~/.config/nushell/zoxide.nu

$env.GOPATH = ($env.HOME | path join "go")
