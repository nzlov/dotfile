#!/bin/sh
git clone https://github.com/nzlov/dotfile ~/.nzlovdotfile
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm ~/.vimrc
ln -s ~/.nzlovdotfile/vimrc ~/.vimrc
rm ~/.tmux.conf
ln -s ~/.nzlovdotfile/tmux.conf ~/.tmux.conf
rm ~/.tmux.conf.local
cp ~/.nzlovdotfile/tmux.conf.local ~/.tmux.conf.local
