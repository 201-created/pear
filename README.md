## Installation

```
npm install -g jshint
brew install vim
brew install the_silver_searcher
brew install bash-completion # optional
brew install git # suggested, required for bash completion
git clone git@github.com:201-created/pear.git ~/.pear
# if using bash:
echo "source ~/.pear/bash.sh" >> ~/.bash_profile
# if using zsh:
echo "source ~/.pear/zsh.sh" >> ~/.zshrc
echo "source-file ~/.pear/tmux.conf" >> ~/.tmux.conf
echo "so ~/.pear/vimrc" >> ~/.vimrc
echo -e "[include]\n  path = ~/.pear/gitconfig" >> ~/.gitconfig
git clone git@github.com:gmarik/Vundle.vim.git ~/.pear/vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

### Notes

You can create a `~/.gitconfig.local` for any local git config overrides. It
is automatically included.
