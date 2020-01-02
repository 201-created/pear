echo "Installing necessary software..."
echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Installing Vim..."
brew install vim
echo "Installing Silver Searcher ($ ag <pattern>)..."
brew install the_silver_searcher
echo "Installing bash-completion..."
brew install bash-completion
echo "Installing git..."
brew install git
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
echo "Installing rvm and the latest Ruby..."
curl -sSL https://get.rvm.io | bash -s stable --ruby
echo "Installing spf13..."
curl http://j.mp/spf13-vim3 -L -o - | sh
echo "Installing jshint..."
npm install -g jshint
echo "Installations complete!"
echo "Setting up local environment..."
git clone git@github.com:TSiege/tristan.git ~/.tristan
echo "Setting up .bash_profile"
[[ -f ~/.bash_profile ]] && mv ~/.bash_profile ~/.bash_profile.bak
ln -s ~/.tristan/bash_profile.sh ~/.bash_profile
echo "Setting up .gitignore"
[[ -f ~/.gitignore ]] && mv ~/.gitignore ~/.gitignore.bak
ln -s ~/.tristan/gitignore ~/.gitignore
echo "Setting up .gitconfig"
[[ -f ~/.gitconfig ]] && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/.tristan/gitconfig ~/.gitconfig
echo "Setting up .tmux.conf"
[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s ~/.tristan/tmux.conf ~/.tmux.conf
echo "Setting up .vimrc.local"
[[ -f ~/.vimrc.local ]] && mv ~/.vimrc.local.bak ~/.vimrc.local.bak
ln -s ~/.tristan/vimrc.local ~/.vimrc.local
echo "Setting up .vimrc.bundles.local"
[[ -f ~/.vimrc.bundles.local ]] && mv ~/.vimrc.bundles.local ~/.vimrc.bundles.local.bak
ln -s ~/.tristan/vimrc.bundles.local ~/.vimrc.bundles.local
echo "All done! Open a new window for a test drive"
