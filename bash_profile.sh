# Source all desired files from tristan repo
source ~/.tristan/shell_scripts/functions.sh
source ~/.tristan/shell_scripts/aliases.sh
source ~/.tristan/shell_scripts/completion.sh
source ~/.tristan/shell_scripts/profile.sh
# Source ~/.profile for secret env variables
[[ -s "/Users/$USER/.profile" ]] && source "/Users/$USER/.profile"

prompt

# Source nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
# Sourcing RVM (MUST BE LAST IN PROFILE)
[[ -s "$RVM_DIR/scripts/rvm" ]] && source "$RVM_DIR/scripts/rvm"

export PATH="/usr/local/opt/libpq/bin:$PATH"' >> /Users/tristan/.bash_profile
