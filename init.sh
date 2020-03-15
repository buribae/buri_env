#!/bin/bash
export BURI_UTIL="${PWD}/util.sh"
. $BURI_UTIL

show_help() {
  e_warning "Usage: ./init.sh [options]"
  e_warning "  Options:"
  e_warning "          -b, --brew     Initialize HomeBrew"
  e_warning "          -z, --zsh      Initialize Zsh"
  e_warning "          -v, --vim      Initialize Vim"
  e_warning "          -a, --all      Initialize All"
  exit 1
}

clean() {
  e_bold "Cleaning temp variables..."
  unset BURI_UTIL Brew Zsh Vim
}

# No argument
if [[ $# -eq 0 ]] ; then show_help; fi

# Parse arguments
while (( "$#" )); do case $1 in
  -a|--all) Zsh=1;Brew=1;Vim=1;;
  -b|--brew) Brew=1;;
  -z|--zsh) Zsh=1;;
  -v|--vim) Vim=1;;
  -h|--help) show_help;;
esac; shift; done


e_bold "Initializing buri_env..."

# BREW (OSX)
if is_os "darwin"; then
  (($Brew)) && e_header "brew" && init homebrew
fi

# ZSH
(($Zsh)) && e_header "zsh" && init zsh

# VIM
(($Vim)) && e_header "vim" && init vim

clean && e_bold "Done."