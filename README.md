## Installation

```
npm install -g jshint
brew install the_silver_searcher
git clone git@github.com:201-created/pear.git ~/.pear
echo "source ~/.pear/bash.sh" >> ~/.bash_profile
echo "source-file ~/.pear/tmux.conf" >> ~/.tmux.conf
echo "so ~/.pear/vimrc" >> ~/.vimrc
echo -e "[include]\n  path = ~/.pear/gitconfig" >> ~/.gitconfig
git clone git@github.com:gmarik/Vundle.vim.git ~/.pear/vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
