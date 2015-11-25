source "/Users/$USER/.tristan/bash/profile.sh"
# Source ~/.profile for secret env variables
source "/Users/$USER/.profile"

prompt

# Sourcing RVM (MUST BE LAST IN PROFILE)
[[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"
