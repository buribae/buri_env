#!/bin/bash

# Install brew
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Install brew bundle 
brew tap Homebrew/bundle

brew update
brew upgrade

# Install brew apps
brew bundle --file=./homebrew/Brewfile

# Clean Up
brew cleanup && brew prune
