# custom commands
source ~/.tristan/shell_scripts/functions.sh
# source brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# set autocompletes
autoload -Uz compinit && compinit
fpath=(/usr/local/share/zsh-completions $fpath)

# Source all desired files from tristan repo
source "/Users/$USER/.tristan/shell_scripts/profile.sh"
# Source ~/.profile for secret env variables
[[ -s "/Users/$USER/.profile" ]] && source "/Users/$USER/.profile"

# Git status
# autoload -U git_vcs_setup && git_vcs_setup

# Sourcing RVM (MUST BE LAST IN PROFILE)
[[ -s "$RVM_DIR/scripts/rvm" ]] && source "$RVM_DIR/scripts/rvm"
