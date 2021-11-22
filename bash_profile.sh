# Source all desired files from tristan repo
source ~/.tristan/bash/functions.sh
source ~/.tristan/bash/aliases.sh
source ~/.tristan/bash/completion.sh
source ~/.tristan/bash/profile.sh
# Source ~/.profile for secret env variables
[[ -s "/Users/$USER/.profile" ]] && source "/Users/$USER/.profile"

prompt

# Source nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
# Sourcing RVM (MUST BE LAST IN PROFILE)
[[ -s "$RVM_DIR/scripts/rvm" ]] && source "$RVM_DIR/scripts/rvm"

export PATH="/usr/local/opt/libpq/bin:$PATH"' >> /Users/tristan/.bash_profile
