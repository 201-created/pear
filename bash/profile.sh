# default open files in OSX is very low
ulimit -n 1024

# node path
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
# gitconfig stuff
export GIT_MERGE_AUTOEDIT='no'
# editor settings
export EDITOR=vim
export GIT_EDITOR=vim
export SVN_EDITOR=vim
export CLICOLOR=1
export VISUAL=vim
# homebrew path
export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"
#final path
export PATH="$USR_PATHS:$PATH"

#supporting files
source ~/.tristan/bash/functions.sh
source ~/.tristan/bash/aliases.sh
source ~/.tristan/bash/completion.sh
