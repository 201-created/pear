if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/brew_bash_completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/brew_bash_completion.sh
fi
