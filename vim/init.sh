# !/bin/bash
. $BURI_UTIL

# Install NerdTree
if ! dir_exists "~/.vim/pack/vendor/start/nerdtree"; then
    git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
    vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q && e_success "Installed NerdTree plugin for Vim."
fi

# Copy vimrc
cp ./vim/vimrc ~/.vimrc && e_success "Installed custom vimrc."
