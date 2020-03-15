#!/bin/bash
. $BURI_UTIL

# Install brew
if ! cmd_exists 'brew'; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && e_success "Installed HomeBrew."
fi

# Install brew bundle
brew tap Homebrew/bundle

brew update
brew upgrade

# Install brew apps
brew bundle --file=./homebrew/Brewfile

# Clean Up
brew cleanup && brew prune
