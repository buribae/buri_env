#!/bin/zsh

usage () {
  e_header "usage"
  if [ $2 ]; then
    e_arrow "$0 [command] [services]"
    e_arrow "commands:"
    e_arrow "\t $1"
    e_arrow "services:"
    e_arrow "\t $2"
  else
    e_arrow "$0 [command] [parameters]"
    e_arrow "commands:"
    e_arrow "\t $1"
  fi
}

errexit () {
  e_error "$@"
  exit 1
}

checkarg() {
  echo $1
  if [[ $# -eq 1 ]]; then
    errexit "Need $1"
  fi
}

#
# Set Colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and  Logging
#

e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}

#
# USAGE FOR SEEKING CONFIRMATION
# seek_confirmation "Ask a question"
# Credt: https://github.com/kevva/dotfiles
#
# if is_confirmed; then
#   some action
# else
#   some other action
# fi
#

seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

# underlined
seek_confirmation_head() {
  printf "\n${underline}${bold}$@${reset}"
  read -p "${underline}${bold} (y/n)${reset} " -n 1
  printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  return 0
fi
return 1
}

#
# Test whether a command exists
# $1 = cmd to test
# Usage:
# if type_exists 'git'; then
#   some action
# else
#   some other action
# fi
#

type_exists() {
if [ $(type -P $1) ]; then
  return 0
fi
return 1
}

#
# Test which OS the user runs
# $1 = OS to test
# Usage: if is_os 'darwin'; then
#

is_os() {
if [[ "${OSTYPE}" == $1* ]]; then
  return 0
fi
return 1
}
