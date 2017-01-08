#!/usr/bin/env bash

mkdir -p bundle
mkdir -p autoload
mkdir -p colors

# Install pathogen.

pathogenFile='autoload/pathogen.vim'
echo $pathogenFile

if [ -f $pathogenFile ]
then
    echo "Pathogen.vim exists, out with the old and in with the new."
    rm $pathogenFile
fi

wget -P autoload https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim 

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install critical color scheme (vim does not work without this, I swear).

molokai='colors/molokai.vim'
if [ -f $molokai ]
then
    echo $molokai"exists, out with the old and in with the new."
    rm $molokai
fi

# Install vim-plug magic.

wget -P colors https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
nvim +PlugInstall
