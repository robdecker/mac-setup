#!/bin/bash

# Helper function
command_exists () {
  hash "$1" 2> /dev/null
}

CURRENTPATH="`pwd`";

# Make sure Xcode Command Line Tools are installed.
if ! command_exists ruby; then
  echo >&2 "Please install Xcode Command Line Tools. Aborting."
  exit 1
fi

# Install homebrew
if ! command_exists brew; then
  echo >&2 "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Homebrew taps, formulae, casks, mac app store
echo >&2 "Installing Homebrew taps, formulae, casks, mac app store apps..."
brew bundle --verbose

# Install Homebrew casks into global applications directory.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Drush
echo >&2 "Installing Drush..."
composer global require drush/drush
ln -s ~/.composer/vendor/bin/drush /usr/local/bin/drush

# Terminus (Pantheon)
echo >&2 "Installing Terminus..."
mkdir -p $HOME/.drush/terminus
cd $HOME/.drush/terminus
composer require pantheon-systems/terminus
cd $CURRENTPATH;

# NPM and related
## Update: $ npm list -g --depth 0
echo >&2 "Installing global NPM packages..."
npm install -g bower
npm install -g caniuse-cmd
npm install -g create-react-app
npm install -g grunt
npm install -g gulp
npm install -g gulp-cli
npm install -g jshint
npm install -g npm
npm install -g npm-check
npm install -g npm-check-updates
npm install -g sass-lint
npm install -g vtop
npm install -g yarn
npm install -g yo

# Ansible
## https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-pip
echo >&2 "Installing Ansible..."
pip install ansible

# Ruby
echo >&2 "Installing RVM & a Ruby..."
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby
# rvm install <ruby version>
