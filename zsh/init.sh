# !/bin/bash

# install oh my zsh
if ! hash zsh 2>/dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# copy zshrc
cp ./zsh/zshrc ~/.zshrc
