#!/bin/bash

# Useful links

################################################################################

command_exists () {
  hash "$1" 2> /dev/null
}

CURRENTPATH="`pwd`";

# Make sure Xcode Command Line Tools are installed.
if ! command_exists ruby; then
  echo >&2 "Please install Xcode Command Line Tools. Aborting."
  exit 1
fi

################################################################################

if ! command_exists brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# https://github.com/Homebrew/homebrew-dupes
if ! [ `brew tap | grep homebrew/dupes` ]; then
  brew tap homebrew/dupes
fi

# https://github.com/Homebrew/homebrew-versions
if ! [ `brew tap | grep homebrew/versions` ]; then
  brew tap homebrew/versions
fi

# https://github.com/Homebrew/homebrew-completions
if ! [ `brew tap | grep homebrew/completions` ]; then
  brew tap homebrew/completions
fi

if ! [ `brew tap | grep homebrew/php` ]; then
  brew tap homebrew/php
fi

# https://github.com/caskroom/homebrew-cask
if ! [ `brew tap | grep caskroom/cask` ]; then
  brew tap caskroom/cask
fi

# https://github.com/caskroom/homebrew-versions
if ! [ `brew tap | grep caskroom/versions` ]; then
  brew tap caskroom/versions
fi

# https://github.com/buo/homebrew-cask-upgrade
if ! [ `brew tap | grep buo/cask-upgrade` ]; then
  brew tap buo/cask-upgrade
fi

#exit 0

################################################################################

# Install into global applications directory.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# XQuartz, used for X11 apps.
brew cask install xquartz

# Composer - don't use Homebrew version due to PHP dependencies
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Drush
composer global require drush/drush
ln -s ~/.composer/vendor/bin/drush /usr/local/bin/drush

# Terminus (Pantheon)
git clone https://github.com/pantheon-systems/terminus.git $HOME/.drush/terminus
cd $HOME/.drush/terminus
composer update --no-dev
drush cc drush
cd $CURRENTPATH;

# Drush SQL Sync Pipe
# See https://drupal.org/project/drush_sql_sync_pipe
drush dl drush_sql_sync_pipe --destination=$HOME/.drush
drush cc drush

# NPM and related
brew install node
npm install -g bower
npm install -g caniuse-cmd
npm install -g gulp
npm install -g jshint
npm install -g npm-check-updates
npm install -g sass-lint
npm install -g vtop
npm install -g yarn

# Fish shell
brew install fish

brew install ack
brew install brew-cask-completion
brew install git
brew install git-extras
brew install libdvdcss
brew install openssl
brew install pv
brew install python
brew install rsync
brew install sqlite
brew install wget

# Vagrant and Ansible
brew cask install virtualbox
brew cask install vagrant
brew install homebrew/completions/vagrant-completion
pip install --upgrade ansible


################################################################################
# Apps

brew cask install adapter
brew cask install adium
brew cask install alfred
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install atom
brew cask install backblaze
brew cask install bartender
brew cask install bettertouchtool
brew cask install betterzipql
brew cask install beyond-compare
brew cask install brackets
brew cask install burn
brew cask install caffeine
brew cask install cakebrew
brew cask install crashplan
brew cask install dash2
brew cask install docker
brew cask install dropbox
brew cask install evernote
brew cask install filezilla
brew cask install firefox
brew cask install flickr-uploadr
brew cask install fluid
brew cask install flux
brew cask install gas-mask
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-photos-backup
brew cask install handbrake
brew cask install hex-fiend
# brew cask install hostbuddy # using gas-mask
brew cask install hyper
brew cask install integrity
brew cask install istat-menus
brew cask install iterm2
brew cask install launchcontrol
brew cask install limechat
brew cask install liteicon
brew cask install livereload
brew cask install macdown
brew cask install mailplane
brew cask install namechanger
brew cask install opendns-updater
brew cask install path-finder
brew cask install phpstorm
brew cask install qlcolorcode
brew cask install qlimagesize
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install radiant-player
brew cask install sequel-pro
brew cask install shimo
brew cask install sketch
brew cask install skitch
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install sqlpro-for-sqlite
brew cask install sublime-text
brew cask install suspicious-package
brew cask install sync
brew cask install teamviewer
brew cask install tower
brew cask install transmit
brew cask install tunnelbear
# brew cask install vagrant # installed above
# brew cask install virtualbox # installed above
brew cask install vlc
brew cask install vmware-fusion6
brew cask install zoomus
