# !/bin/bash
. $BURI_UTIL

# Install Oh My Zsh
if ! cmd_exists 'zsh'; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && e_success "Installed zsh."
fi

# Install Zulu
if ! cmd_exists 'zulu'; then
  curl -L https://zulu.molovo.co/install | zsh && zsh && e_success "Installed zulu."
fi

# Copy zshrc
cp ./zsh/zshrc ~/.zshrc && e_success "Installed custom zshrc."
