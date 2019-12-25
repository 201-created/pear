# node path
export NODE_PATH="/usr/local/lib/node_modules"
# ruby path
export RUBY_PATH="/usr/local/opt/ruby/bin"
# node version manager path
export NVM_DIR="$HOME/.nvm"
# ruby version manager path
export RVM_DIR="/Users/$USER/.rvm"
# gitconfig stuff
export GIT_MERGE_AUTOEDIT='no'
# editor settings
export EDITOR=vim
export GIT_EDITOR=vim
export SVN_EDITOR=vim
export CLICOLOR=1
export VISUAL=vim
# vscode path
export VSCODE_PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# homebrew path
export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"
#final path
export PATH="$RUBY_PATH:$NODE_PATH:$USR_PATHS:$PATH:$VSCODE_PATH"

#supporting files
source ~/.tristan/bash/functions.sh
source ~/.tristan/bash/aliases.sh
source ~/.tristan/bash/completion.sh
