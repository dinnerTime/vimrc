#!/usr/bin/env bash

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install neovim
brew install neovim
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/autoload ~/.config/nvim/bundle && \
curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

 update zshrc with custom aliases
`echo 'export PROJ="$HOME/proj"' >> ~/.zshrc`
`echo 'alias vim="nvim"' >> ~/.zshrc`
`echo 'alias vi="nvim"' >> ~/.zshrc`
`echo 'ssh-add ~/.ssh/id_rsa_github' >> ~/.zshrc`

`source ~/.zshrc`

