#!/bin/bash

init() {
  chmod +x ./$1/init.sh && ./$1/init.sh
}


# install brew
init homebrew

# install zsh
init zsh

# install vimrc
init vim
