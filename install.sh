#!/usr/bin/env bash

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install neovim
brew install neovim
mkdir -p ~/.config/nvim
ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# update zshrc with custom aliases
`echo 'export PROJ="$HOME/proj"' >> ~/.zshrc`
`echo 'alias vim="nvim"' >> ~/.zshrc`
`echo 'alias vi="nvim"' >> ~/.zshrc`

`source ~/.zshrc`
