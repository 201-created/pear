## Introduction
This is my personal fork of [Pear](https://github.com/201-created/pear) made by [201 Created](http://www.201-created.com/), which simply has my personal vim and bash preferences on top of theirs.

## Installation

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install vim
brew install the_silver_searcher
brew install bash-completion # optional
brew install git # suggested, required for bash completion
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
npm install -g jshint
git clone git@github.com:TSiege/tristan.git ~/.tristan
# if using bash:
[[ -f ~/.bash_profile ]] && mv ~/.bash_profile ~/.bash_profile.bak
ln -s ~/.tristan/bash_profile.sh ~/.bash_profile
[[ -d ~/.vim/colors ]] && mv ~/.vim/colors ~/.vim/colors.bak
ln -s ~/.tristan/vim/colors ~/.vim/colors
[[ -f ~/.gitignore ]] && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/.tristan/gitignore ~/.gitignore
echo "source-file ~/.tristan/tmux.conf" >> ~/.tmux.conf
echo "so ~/.tristan/vimrc" >> ~/.vimrc
echo -e "[include]\n  path = ~/.tristan/gitconfig" >> ~/.gitconfig
git clone git@github.com:gmarik/Vundle.vim.git ~/.tristan/vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

### Notes

You can create a `~/.gitconfig.local` for any local git config overrides. It
is automatically included.
