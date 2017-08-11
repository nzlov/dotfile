#!/bin/sh
git clone https://github.com/nzlov/dotfile ~/.nzlovdotfile
ln -s ~/.nzlovdotfile/vimrc ~/.vimrc
ln -s ~/.nzlovdotfile/tmux.conf ~/.tmux.conf
cp ~/.nzlovdotfile/tmux.conf.local ~/tmux.conf.local
